import Foundation

extension DebugURLHandlerView {
    struct Deps {
        let dataStore: DebugURLHandlerViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}