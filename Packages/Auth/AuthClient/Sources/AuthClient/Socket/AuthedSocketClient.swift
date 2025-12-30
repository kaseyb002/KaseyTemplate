import AuthModel
import AuthTokenProvider
import Extensions
import Foundation
import Socket
import Starscream

public final actor AuthedSocketClient: SocketClient {
    public private(set) var hostAddress: HostAddress
    private let pool: SocketConnectionPool
    private let authTokenProvider: any AuthTokenProvider
    
    public init(
        pool: SocketConnectionPool,
        hostAddress: HostAddress,
        authTokenProvider: any AuthTokenProvider,
    ) {
        self.pool = pool
        self.hostAddress = hostAddress
        self.authTokenProvider = authTokenProvider
    }

    public func connectSocket(
        request: any SocketConnectionRequest,
        decoder: JSONDecoder,
    ) async throws -> SocketConnection {
        let urlRequest: URLRequest = try await makeAuthenticatedRequest(from: request)
        let webSocket: WebSocket = .init(request: urlRequest)
        return try await pool.connect(
            urlRequest: urlRequest,
            createConnection: { [weak webSocket, decoder] in
                guard let webSocket: WebSocket else {
                    throw SocketError.socketPrematurelyDeallocated
                }
                return .init(
                    urlRequest: urlRequest,
                    decoder: decoder,
                    socket: webSocket,
                )
            }
        )
    }
    
    public func disconnect(
        socket: any UISocketConnection,
    ) async throws {
        try await pool.releaseConnection(urlRequest: socket.urlRequest)
    }
    
    private func makeAuthenticatedRequest(
        from request: any SocketConnectionRequest,
    ) async throws -> URLRequest {
        guard let token: String = try await authTokenProvider.token() else {
            throw AuthError.notSignedIn
        }
        var urlComponents: URLComponents = .init()
        urlComponents.scheme = hostAddress.scheme
        urlComponents.host = hostAddress.host
        urlComponents.port = hostAddress.port
        urlComponents.path = request.path
        urlComponents.queryItems = request.queryItems
        guard let url: URL = urlComponents.url else {
            throw SocketError.missingURL
        }
        var urlRequest: URLRequest = .init(
            url: url,
            cachePolicy: request.cachePolicy,
            timeoutInterval: request.timeoutInterval,
        )
        urlRequest.setValue("Authorization", forHTTPHeaderField: "Token \(token)")
        return urlRequest
    }
    
    public func update(hostAddress: HostAddress) async {
        self.hostAddress = hostAddress
    }
}
