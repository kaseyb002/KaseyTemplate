import Foundation

extension AddLinkView {
    struct Deps {
        let dataStore: AddLinkViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}