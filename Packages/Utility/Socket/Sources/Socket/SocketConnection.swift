import Combine
import Foundation
import Logger
import Starscream
import UIKit

public final class SocketConnection: UISocketConnection, @unchecked Sendable {
    public let id: UUID
    public let urlRequest: URLRequest
    public let dataReceived: PassthroughSubject<Data, Never> = .init()
    public let connectionStatus: CurrentValueSubject<SocketConnectionStatus, Never> = .init(.idle)
    private var isIntentionalDisconnect: Bool = false
    private var subscriptions: Set<AnyCancellable> = []
    private var socketEventSubscription: AnyCancellable?
    private var socket: Starscream.WebSocket
    private let decoder: JSONDecoder
    private var exponentialBackoffState: ExponentialBackoffState = .init()

    public func disconnect() {
        logIt(.debug, "🌐 disconnecting socket \(urlRequest.url?.absoluteString ?? "no url")")
        isIntentionalDisconnect = true
        exponentialBackoffState.reset()
        socket.forceDisconnect()
    }
    
    public func connect() {
        logIt(.debug, "🌐 connecting socket \(urlRequest.url?.absoluteString ?? "no url")")
        isIntentionalDisconnect = false
        exponentialBackoffState.reset()
        connectionStatus.value = .connecting
        socket.connect()
    }
    
    private func attemptReconnectIfNeeded() {
        switch connectionStatus.value {
        case .intentionallyDisconnected, .unintentionallyDisconnected:
            attemptReconnect()

        case .idle, .connected, .connecting:
            break
        }
    }
    
    private func attemptReconnect() {
        exponentialBackoffState.reconnectTask?.cancel()
        
        guard exponentialBackoffState.isMaxAttemptsExceeded == false else {
            logIt(.error, "🌐 max reconnect attempts (\(exponentialBackoffState.maxReconnectAttempts)) reached for socket \(urlRequest.url?.absoluteString ?? "no url")")
            return
        }
        
        let delay: TimeInterval = exponentialBackoffState.calculateDelay()
        
        exponentialBackoffState.reconnectAttempt += 1
        logIt(.debug, "🌐 scheduling reconnect attempt \(exponentialBackoffState.reconnectAttempt)/\(exponentialBackoffState.maxReconnectAttempts) in \(String(format: "%.1f", delay))s for socket \(urlRequest.url?.absoluteString ?? "no url")")
        
        exponentialBackoffState.reconnectTask = Task { [weak self] in
            do {
                try await Task.sleep(for: .seconds(delay))
                guard !Task.isCancelled else { return }
                self?.performReconnect()
            } catch {
                // Task was cancelled, ignore
            }
        }
    }
    
    private func performReconnect() {
        logIt(.debug, "🌐 performing reconnect for socket \(urlRequest.url?.absoluteString ?? "no url")")
        recreateSocket()
        // Use internal connect that doesn't reset the backoff counter
        isIntentionalDisconnect = false
        connectionStatus.value = .connecting
        socket.connect()
    }
    
    private func recreateSocket() {
        socket.delegate = nil
        socket.onEvent = nil
        socket = .init(request: urlRequest)
        setupSocketSubscriptions()
    }
    
    public init(
        id: UUID = UUID(),
        urlRequest: URLRequest,
        decoder: JSONDecoder,
        socket: Starscream.WebSocket
    ) {
        self.id = id
        self.urlRequest = urlRequest
        self.decoder = decoder
        self.socket = socket
        
        setupSocketSubscriptions()
        setupAppLifecycleSubscriptions()
    }
    
    private func setupSocketSubscriptions() {
        socket.onEvent = { [weak self, urlRequest] event in
            guard let self else { return }
            switch event {
            case .connected:
                isIntentionalDisconnect = false
                exponentialBackoffState.reset()
                connectionStatus.value = .connected
                logIt(.debug, "🌐 websocket is connected: \(urlRequest.url?.absoluteString ?? "no url")")

            case .disconnected(let reason, let code):
                connectionStatus.value = isIntentionalDisconnect ? .intentionallyDisconnected : .unintentionallyDisconnected
                let intent = isIntentionalDisconnect ? "intentionally" : "unintentionally"
                logIt(.debug, "🌐 websocket is \(intent) disconnected: \(reason) \(code) \(urlRequest.url?.absoluteString ?? "no url")")

            case .text(let string):
                guard let data: Data = string.data(using: .utf8) else {
                    return
                }
                struct SocketMessage: Decodable {
                    let updateType: String // to trim the console logs
                }
                if let socketMessage: SocketMessage = try? decoder.decode(SocketMessage.self, from: data) {
                    logIt(.debug, "🌐 Socket message: \(socketMessage.updateType)")
                } else {
                    logIt(.debug, "🌐 Socket message: \(string)")
                }
                dataReceived.send(data)
                
            case .binary(let data):
                dataReceived.send(data)
                
            case .viabilityChanged(let isViable):
                if isViable == false {
                    attemptReconnectIfNeeded()
                }
                
            case .reconnectSuggested:
                connectionStatus.value = .unintentionallyDisconnected
                attemptReconnectIfNeeded()
                
            case .cancelled:
                connectionStatus.value = isIntentionalDisconnect ? .intentionallyDisconnected : .unintentionallyDisconnected
                logIt(.debug, "🌐 cancelled connection")
                if isIntentionalDisconnect == false {
                    attemptReconnectIfNeeded()
                }
                
            case .error(let error):
                connectionStatus.value = .unintentionallyDisconnected
                logIt(.error, "🌐 error connecting socket, attempting reconnect", error: error)
                attemptReconnect()
                
            case .ping, .pong, .peerClosed:
                break
            }
        }
    }
    
    private func setupAppLifecycleSubscriptions() {
        NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
            .debounce(for: .seconds(0.6), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.attemptReconnectIfNeeded()
            }
            .store(in: &subscriptions)
        
        NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)
            .sink { [weak self] _ in
                // this is a temporary disconnect
                // so we won't release it from the socket connection pool
                self?.disconnect()
            }
            .store(in: &subscriptions)
    }
}
