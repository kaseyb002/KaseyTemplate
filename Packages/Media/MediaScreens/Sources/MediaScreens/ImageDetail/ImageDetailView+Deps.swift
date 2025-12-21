import Foundation

extension ImageDetailView {
    struct Deps {
        let dataStore: ImageDetailViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}
