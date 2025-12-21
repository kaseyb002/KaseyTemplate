import Foundation

public struct TokenResponse: Decodable, Sendable {
    public let token: String
    public let isNewAccount: Bool
    
    public init(
        token: String,
        isNewAccount: Bool
    ) {
        self.token = token
        self.isNewAccount = isNewAccount
    }
}
