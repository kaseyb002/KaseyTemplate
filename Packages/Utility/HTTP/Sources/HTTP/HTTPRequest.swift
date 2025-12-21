import Foundation
import KaseyHTTP

public protocol HTTPRequest<ResponseType>: Sendable where ResponseType: Decodable {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var body: HTTPBody? { get }
    var headers: [String: String] { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeoutInterval: TimeInterval { get }

    associatedtype ResponseType: Decodable
}

extension HTTPRequest {
    public var method: HTTPMethod { .get }
    public var queryItems: [URLQueryItem]? { nil }
    public var body: HTTPBody? { nil }
    public var headers: [String: String] { [:] }
    public var cachePolicy: URLRequest.CachePolicy { .reloadRevalidatingCacheData }
    public var timeoutInterval: TimeInterval { 30 }
}
