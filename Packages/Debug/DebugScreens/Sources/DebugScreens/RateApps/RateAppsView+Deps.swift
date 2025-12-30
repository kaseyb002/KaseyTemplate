import Foundation

extension RateAppsView {
    struct Deps {
        let dataStore: RateAppsViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}