import Foundation

extension GIFDetailView {
    struct Deps {
        let dataStore: GIFDetailViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}