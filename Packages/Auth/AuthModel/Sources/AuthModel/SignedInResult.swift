import Foundation

public struct SignedInResult: Equatable, Sendable {
    public let isNewAccount: Bool
    
    public init(
        isNewAccount: Bool
    ) {
        self.isNewAccount = isNewAccount
    }
}
