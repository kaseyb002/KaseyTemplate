import Foundation
import UserModel
import UtilityModel

extension HelpView {
    enum Action {
        case ui(UI)

        enum UI {
            case closeTapped
            case sendFeedbackTapped
            case signOutTapped
            case signOutConfirmTapped
            case debugMenuTapped
            case debugMenuEnabled
        }
    }
}

// MARK: - Handle
extension HelpView {
    func handle(action: HelpView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: HelpView.Action.UI) {
        switch action {
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
            
        case .sendFeedbackTapped:
            deps.didSelectNavAction(.sendFeedback)
            
        case .signOutConfirmTapped:
            Task {
                try await deps.dataStore.signOut()
                // appNavigator should dismiss to sign in view
            }
            
        case .signOutTapped:
            let alert: AlertModel = .init(
                title: "Sign out?",
                message: "Are you sure you want to sign out?",
                actions: [
                    .init(title: "Sign out", style: .destructive) {
                        handle(action: .ui(.signOutConfirmTapped))
                    },
                ]
            )
            deps.didSelectNavAction(.alert(alert))
            
        case .debugMenuTapped:
            deps.didSelectNavAction(.debugMenu)
            
        case .debugMenuEnabled:
            model.isDebugMenuEnabled = true
//            Debug.shared.config.isShowingDebugMenu = true
        }
    }
}
