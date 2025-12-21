import Foundation

public protocol DisplayableError: Error {
    var displayableErrorTitle: String { get }
    var displayableErrorMessage: String? { get }
}
