import Foundation

extension MyProfileView {
    struct Deps {
        let dataStore: MyProfileViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}
