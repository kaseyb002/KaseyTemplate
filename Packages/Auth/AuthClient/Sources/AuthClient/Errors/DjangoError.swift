import Foundation
import Extensions

/// Old-style error format: {"detail": "error message"}
public struct DRFHTTPError: DisplayableError, Decodable {
    public let detail: String
    public var displayableErrorTitle: String { detail }
    public var displayableErrorMessage: String? { nil }
}

/// New DRF ValidationError format: ["error message 1", "error message 2"]
public struct DRFValidationError: DisplayableError, Decodable {
    private let errors: [String]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.errors = try container.decode([String].self)
    }
    
    public var displayableErrorTitle: String {
        // Join multiple errors with newlines, or return first error
        errors.joined(separator: "\n")
    }
    
    public var displayableErrorMessage: String? { nil }
}
