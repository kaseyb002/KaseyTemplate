import Foundation

public enum CreateAccountMethod: Sendable {
    case email(address: String, password: String)
}
