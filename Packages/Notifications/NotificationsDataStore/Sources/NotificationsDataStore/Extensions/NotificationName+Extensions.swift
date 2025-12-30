import Foundation

extension Notification.Name {
    public static let registerForRemoteNotifications: NSNotification.Name = .init(
        "registerForRemoteNotifications"
    )
    public static let didRegisterForRemoteNotificationsWithDeviceToken: NSNotification.Name = .init(
        "didRegisterForRemoteNotificationsWithDeviceToken"
    )
}
