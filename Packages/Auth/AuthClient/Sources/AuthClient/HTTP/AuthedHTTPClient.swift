import AuthModel
import AuthTokenProvider
import Combine
import Foundation
import HTTP
import KaseyHTTP
import Logger

public final actor AuthedHTTPClient: HTTP.HTTPClient {
    private let httpClient: any KaseyHTTP.HTTPClient & Sendable
    private let authTokenProvider: any AuthTokenProvider
    private let didDetectUnauthorizedSubject: PassthroughSubject<Void, Never> = .init()
    public private(set) var hostAddress: HostAddress
    private let jsonDecoder: JSONDecoder
    public var didDetectUnauthorized: AnyPublisher<Void, Never> {
        didDetectUnauthorizedSubject.eraseToAnyPublisher()
    }
    
    public init(
        httpClient: any KaseyHTTP.HTTPClient & Sendable,
        authTokenProvider: any AuthTokenProvider,
        hostAddress: HostAddress,
        jsonDecoder: JSONDecoder,
    ) {
        self.httpClient = httpClient
        self.authTokenProvider = authTokenProvider
        self.hostAddress = hostAddress
        self.jsonDecoder = jsonDecoder
    }
    
    public func send<R: HTTP.HTTPRequest>(_ request: R) async throws -> R.ResponseType {
        guard let token: String = try await authTokenProvider.token() else {
            throw AuthError.notSignedIn
        }
        let request: AuthenticatedRequest = .init(
            request: request,
            token: token,
            hostAddress: hostAddress,
        )
        guard let urlPath: String = request.url?.absoluteString else {
            throw AuthError.emptyURL
        }
        var timeTracker: TimeTracker = .init(
            operation: "\(request.method.rawValue) \(urlPath)"
        )
        do {
            let response: HTTPResponse = try await httpClient.send(request)
            defer { timeTracker.endTracking(.success) }
            return try parse(response: response)
        } catch let error as HTTPResponseError {
            if let status: HTTPResponseStatus = error.response.status,
               status == .unauthorized {
                didDetectUnauthorizedSubject.send(())
            }
            logIt(.error, "🌐 \(urlPath) Failed", error: error)
            timeTracker.endTracking(.failure)
            throw error
        } catch let error as HTTPError {
            logIt(.error, "🌐 \(urlPath) Failed", error: error)
            timeTracker.endTracking(.failure)
            throw KaseyClientError.httpKitError(error)
        } catch let error as AuthError {
            if error == .notSignedIn {
                didDetectUnauthorizedSubject.send(())
            }
            logIt(.error, "🌐 \(urlPath) Failed", error: error)
            timeTracker.endTracking(.failure)
            throw error
        } catch {
            logIt(.error, "🌐 \(urlPath) Failed", error: error)
            timeTracker.endTracking(.failure)
            throw error
        }
    }
    
    private struct AuthenticatedRequest<ResponseType: Decodable>: TypedHTTPRequestable, Sendable {
        typealias ResponseType = ResponseType
        
        let request: any HTTP.HTTPRequest<ResponseType>
        let token: String
        let hostAddress: HostAddress

        var url: URL? {
            var urlComponents: URLComponents = .init()
            urlComponents.scheme = hostAddress.scheme
            urlComponents.host = hostAddress.host
            urlComponents.port = hostAddress.port
            urlComponents.path = request.path
            urlComponents.queryItems = request.queryItems
            return urlComponents.url
        }
        
        var headers: [String : String] {
            var authenticatedHeaders: [String: String] = request.headers
            authenticatedHeaders["Authorization"] = "Token \(token)"
            return authenticatedHeaders
        }
        
        var method: HTTPMethod { request.method }
        var body: (any HTTPBody)? { request.body}
        var cachePolicy: URLRequest.CachePolicy { request.cachePolicy }
        var timeoutInterval: TimeInterval { request.timeoutInterval }
    }
    
    private func parse<ResponseType: Decodable>(response: HTTPResponse) throws -> ResponseType {
        guard let data = response.body,
                data.isEmpty == false
        else {
            throw HTTPError(
                code: .cannotDecodeResponse,
                request: response.request
            )
        }
        do {
            return try jsonDecoder.decode(ResponseType.self, from: data)
        } catch {
            logIt(.error, "Failed to decode HTTPResponse", error: error)
            throw error
        }
    }
    
    public func update(hostAddress: HostAddress) async {
        self.hostAddress = hostAddress
    }
}
