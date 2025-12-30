import Foundation

extension HelpView {
    struct Deps {
        let dataStore: HelpViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}