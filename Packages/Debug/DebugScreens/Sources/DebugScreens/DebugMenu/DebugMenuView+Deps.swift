import Foundation

extension DebugMenuView {
    struct Deps {
        let dataStore: DebugMenuViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}