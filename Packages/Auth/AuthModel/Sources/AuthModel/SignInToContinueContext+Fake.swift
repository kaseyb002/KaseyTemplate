import Foundation

extension SignInToContinueContext {
    public static func fake(
        signInMessage: String = "Sign in to continue",
        onSignInComplete: @MainActor @Sendable @escaping (SignedInResult) -> Void = { _ in }
    ) -> SignInToContinueContext {
        .init(
            signInMessage: signInMessage,
            onSignInComplete: onSignInComplete
        )
    }
}

