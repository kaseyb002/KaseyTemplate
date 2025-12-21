import Extensions
import Foundation
import Logger
import KaseyHTTP

public final actor UnauthedHTTPClient: HTTPClient {
    public private(set) var hostAddress: HostAddress
    private let httpClient: any KaseyHTTP.HTTPClient & Sendable
    private let jsonDecoder: JSONDecoder
    
    public init(
        hostAddress: HostAddress,
        httpClient: any KaseyHTTP.HTTPClient & Sendable,
        jsonDecoder: JSONDecoder
    ) {
        self.hostAddress = hostAddress
        self.httpClient = httpClient
        self.jsonDecoder = jsonDecoder
    }

    public func send<R: HTTPRequest>(_ request: R) async throws -> R.ResponseType {
        let request: UnauthenticatedRequest = .init(
            request: request,
            hostAddress: hostAddress,
        )
        guard let urlPath: String = request.url?.absoluteString else {
            throw UnauthedHTTPError.emptyURL
        }
        var timeTracker: TimeTracker = .init(
            operation: "\(request.method.rawValue) \(urlPath)"
        )
        do {
            let response: HTTPResponse = try await httpClient.send(request)
            defer { timeTracker.endTracking(.success) }
            return try parse(response: response)
        } catch {
            logIt(.error, "🌐 \(urlPath) Failed", error: error)
            timeTracker.endTracking(.failure)
            throw error
        }
    }
    
    public func update(hostAddress: HostAddress) async {
        self.hostAddress = hostAddress
    }
    
    private struct UnauthenticatedRequest<ResponseType: Decodable>: TypedHTTPRequestable, Sendable {
        typealias ResponseType = ResponseType
        
        let request: any HTTP.HTTPRequest<ResponseType>
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
        
        var headers: [String : String] { request.headers }
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
    
    private enum UnauthedHTTPError: Error {
        case emptyURL
    }
}


// TODO: move somewhere
enum KaseyClientError: DisplayableError {
    case httpKitError(HTTPError)
    
    var displayableErrorTitle: String {
        switch self {
        case .httpKitError(let httpKitError):
            switch httpKitError.code {
            case .invalidRequest: "Invalid request"
            case .cannotConnect: "Cannot connect"
            case .cancelled: "Request cancelled"
            case .timedOut: "Request timed out"
            case .cannotAuthenticate: "Not authenticated"
            case .insecureConnection: "Connection not secure"
            case .invalidResponse: "Response not valid"
            case .cannotDecodeResponse: "Response could not be decoded"
            case .resetInProgress: "Request is being reset"
            case .unsupportedVersion: "Request version not supported"
            case .unknown: "Unknown error occurred"
            }
        }
    }
    
    var displayableErrorMessage: String? {
        switch self {
        case .httpKitError:
            nil
        }
    }
}
