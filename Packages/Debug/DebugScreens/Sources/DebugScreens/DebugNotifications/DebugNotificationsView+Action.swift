import Foundation

extension DebugNotificationsView {
    enum Action {
        case initiated
        case ui(UI)

        enum UI {
            case deletePushRegistrationTapped
            case refreshNotificationSettingsTapped
            case requestPermissionTapped
            case registerPushTokenTapped
        }
    }
}
