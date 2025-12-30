import Foundation

public protocol SocketConnectionRequest: Sendable {
    var path: String { get set }
    var queryItems: [URLQueryItem]? { get }
    var timeoutInterval: TimeInterval { get }
    var headers: [String: String] { get }
}

extension SocketConnectionRequest {
    public var queryItems: [URLQueryItem]? { nil }
    public var headers: [String: String] { [:] }
    public var timeoutInterval: TimeInterval { 30 }
    public var cachePolicy: URLRequest.CachePolicy { .reloadRevalidatingCacheData }
}
