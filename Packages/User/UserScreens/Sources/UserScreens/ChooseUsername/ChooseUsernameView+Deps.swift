import Foundation

extension ChooseUsernameView {
    struct Deps {
        let dataStore: ChooseUsernameViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}