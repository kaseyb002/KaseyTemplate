import Foundation
import Extensions

public struct SignInToContinueContext: Equatable, Sendable {
    /// Message to display on Sign-in View
    public let signInMessage: String
    @AlwaysEqual public var onSignInComplete: @MainActor @Sendable (SignedInResult) -> Void

    public init(
        signInMessage: String = "Sign in to continue",
        onSignInComplete: @MainActor @Sendable @escaping (SignedInResult) -> Void
    ) {
        self.signInMessage = signInMessage
        self.onSignInComplete = onSignInComplete
    }
}
