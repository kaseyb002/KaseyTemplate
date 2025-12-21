import Foundation

extension SignInToContinueContext {
    public static func fake(
        signInMessage: String = "Sign in to continue",
        onSignInComplete: @Sendable @escaping () -> Void = {}
    ) -> SignInToContinueContext {
        .init(
            signInMessage: signInMessage,
            onSignInComplete: onSignInComplete
        )
    }
}

