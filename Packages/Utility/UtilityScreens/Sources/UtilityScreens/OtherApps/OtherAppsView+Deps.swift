import Foundation

extension OtherAppsView {
    struct Deps {
        let dataStore: OtherAppsViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}
