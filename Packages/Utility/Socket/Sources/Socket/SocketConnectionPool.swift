import Combine
import Foundation
import Logger

/// Manages socket connections with reference counting to prevent duplicates
public actor SocketConnectionPool {
    private var connections: [URLRequest: ConnectionEntry] = [:]
    
    private struct ConnectionEntry {
        let urlRequest: URLRequest
        let connection: SocketConnection
        var referenceCount: Int
    }
    
    public init() {}
    
    public func connect(
        urlRequest: URLRequest,
        createConnection: () async throws -> SocketConnection
    ) async throws -> SocketConnection {
        guard let url: URL = urlRequest.url else {
            throw SocketError.missingURL
        }
        if let existingConnectionEntry: ConnectionEntry = connections[urlRequest] {
            let socketConnection: SocketConnection = existingConnectionEntry.connection
            if socketConnection.connectionStatus.value.isConnectedOrConnecting == false {
                socketConnection.connect()
            }
            connections[urlRequest]?.referenceCount += 1
            logIt(.debug, "🌐 Reusing socket connection for \(url.absoluteString) (refs: \(connections[urlRequest]?.referenceCount ?? .zero))")
            return socketConnection
        } else {
            let socketConnection: SocketConnection = try await createConnection()
            socketConnection.connect()
            connections[urlRequest] = .init(
                urlRequest: urlRequest,
                connection: socketConnection,
                referenceCount: 1
            )
            logIt(.debug, "🌐 Creating socket connection for \(url.absoluteString) (refs: \(1))")
            return socketConnection
        }
    }
    
    @discardableResult
    public func releaseConnection(
        urlRequest: URLRequest,
    ) async throws -> Bool{
        guard let url: URL = urlRequest.url else {
            throw SocketError.missingURL
        }
        
        connections[urlRequest]?.referenceCount -= 1
        
        guard let existingConnectionEntry: ConnectionEntry = connections[urlRequest] else {
            return false
        }

        if existingConnectionEntry.referenceCount <= .zero {
            existingConnectionEntry.connection.disconnect()
            connections.removeValue(forKey: urlRequest)
            logIt(.debug, "🌐 Disconnecting socket connection for \(url.absoluteString) (no more references)")
            return true
        } else {
            logIt(.debug, "🌐 Released socket reference to \(url.absoluteString) (remaining refs: \(existingConnectionEntry.referenceCount))")
            return false
        }
    }
}
