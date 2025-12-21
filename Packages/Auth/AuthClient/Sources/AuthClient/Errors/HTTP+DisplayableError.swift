import Foundation
import KaseyHTTP
import Extensions

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
