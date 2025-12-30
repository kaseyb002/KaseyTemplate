import Foundation
import NotificationsModel
@preconcurrency import UserNotifications

extension TurnOnNotificationsPromptView {
    enum Action {
        case ui(UI)

        enum UI {
            case viewDidAppear
            case dismissTapped
            case turnOnNotificationsTapped
        }
    }
}

// MARK: - Handle
extension TurnOnNotificationsPromptView {
    func handle(action: TurnOnNotificationsPromptView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
        }
    }
    
    private func handle(ui action: TurnOnNotificationsPromptView.Action.UI) {
        switch action {
        case .viewDidAppear:
            Task {
                try await deps.dataStore.save(
                    onboardingPrompt: \.hasSeenTurnOnNotifications,
                    hasPrompted: true
                )
            }
            
        case .dismissTapped:
            deps.didSelectNavAction(.dismiss())
            
        case .turnOnNotificationsTapped:
            Task {
                let settings: UNNotificationSettings = try await deps.dataStore.notificationSettings()
                if settings.shouldDirectToSystemNotificationSettings {
                    await MainActor.run {
                        deps.didSelectNavAction(.systemNotificationSettings)
                    }
                } else {
                    try await deps.dataStore.requestNotificationPermission()
                }
            }
            deps.didSelectNavAction(.dismiss())
        }
    }
}
