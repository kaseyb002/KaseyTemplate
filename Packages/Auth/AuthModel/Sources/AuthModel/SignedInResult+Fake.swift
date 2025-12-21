import Foundation

extension SignedInResult {
    public static func fake(
        isNewAccount: Bool = false
    ) -> SignedInResult {
        .init(
            isNewAccount: isNewAccount
        )
    }
}

