import Combine
import Extensions
import Foundation
import Starscream

public final actor UnauthedSocketClient: SocketClient {
    public private(set) var hostAddress: HostAddress
    private let pool: SocketConnectionPool
    
    public init(
        hostAddress: HostAddress,
        pool: SocketConnectionPool,
    ) {
        self.hostAddress = hostAddress
        self.pool = pool
    }
    
    public func connectSocket(
        request: any SocketConnectionRequest,
        decoder: JSONDecoder,
    ) async throws -> SocketConnection {
        let urlRequest: URLRequest = try await makeUnauthenticatedRequest(from: request)
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
    
    private func makeUnauthenticatedRequest(
        from request: any SocketConnectionRequest,
    ) async throws -> URLRequest {
        var urlComponents: URLComponents = .init()
        urlComponents.scheme = hostAddress.scheme
        urlComponents.host = hostAddress.host
        urlComponents.port = hostAddress.port
        urlComponents.path = request.path
        urlComponents.queryItems = request.queryItems
        guard let url: URL = urlComponents.url else {
            throw SocketError.missingURL
        }
        return .init(
            url: url,
            cachePolicy: request.cachePolicy,
            timeoutInterval: request.timeoutInterval,
        )
    }
    
    public func update(hostAddress: HostAddress) async {
        self.hostAddress = hostAddress
    }
}
