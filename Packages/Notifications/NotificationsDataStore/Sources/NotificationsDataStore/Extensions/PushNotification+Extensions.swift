import Foundation
import NotificationsModel
@preconcurrency import UserNotifications

extension PushNotification {
    public var category: UNNotificationCategory {
        UNNotificationCategory(
            identifier: categoryID.rawValue,
            actions: additionalActions.map { $0.notificationAction },
            intentIdentifiers: [],
            hiddenPreviewsBodyPlaceholder: hiddenPreviewsBodyPlaceholder,
            categorySummaryFormat: categorySummaryFormat,
            options: []
        )
    }
}
