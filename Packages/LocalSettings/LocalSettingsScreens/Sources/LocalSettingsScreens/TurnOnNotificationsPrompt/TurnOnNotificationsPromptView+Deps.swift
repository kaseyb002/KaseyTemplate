import Foundation

extension TurnOnNotificationsPromptView {
    struct Deps {
        let dataStore: TurnOnNotificationsPromptViewDataStore
        let didSelectNavAction: (NavAction) -> Void
    }
}
