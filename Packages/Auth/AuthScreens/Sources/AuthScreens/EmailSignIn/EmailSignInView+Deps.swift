import Foundation
import AuthModel

extension EmailSignInView {
    struct Deps {
        let dataStore: EmailSignInViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}
