import Foundation

extension DeleteAccountView {
    struct Deps {
        let dataStore: DeleteAccountViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}