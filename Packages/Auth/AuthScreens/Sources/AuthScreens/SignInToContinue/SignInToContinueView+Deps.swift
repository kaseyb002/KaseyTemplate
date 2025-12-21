import AuthModel
import Foundation

extension SignInToContinueView {
    struct Deps {
        let dataStore: SignInToContinueViewDataStore
        let appleSignInController: AppleSignInController
        let didSelectNavAction: (NavAction) -> Void
    }
}
