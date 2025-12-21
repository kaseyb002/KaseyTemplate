import Foundation
@preconcurrency import UserNotifications

public protocol NotificationsBlockable {
    @MainActor
    func block(notification: UNNotification) -> Bool
}
