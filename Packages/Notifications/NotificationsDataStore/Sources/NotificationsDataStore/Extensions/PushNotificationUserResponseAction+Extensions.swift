import Foundation
import NotificationsModel
@preconcurrency import UserNotifications

extension PushNotificationUserResponseAction {
    var notificationAction: UNNotificationAction {
        .init(
            identifier: actionID.rawValue,
            title: title,
            options: options,
            icon: nil // definitely need to add this
        )
    }
}
