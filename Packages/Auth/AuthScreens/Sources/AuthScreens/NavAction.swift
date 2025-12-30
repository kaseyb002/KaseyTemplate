import AuthModel
import Foundation

public enum NavAction {
    case signedIn(SignedInResult)
    case emailSignIn(completion: @MainActor @Sendable (SignedInResult) -> Void)
    case googleSignIn(handleToken: @MainActor @Sendable (Result<String, Error>) -> Void)
    case dismiss(completion: @MainActor () -> Void = {})
    case getHelp
    case debugMenu
}
