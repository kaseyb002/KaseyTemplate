import Foundation
@preconcurrency import UserNotifications

public protocol PushNotificationUserResponseAction: Sendable {
    var actionID: PushNotificationUserResponseActionID { get }
    var title: String { get }
    var options: UNNotificationActionOptions { get }
    
    func action(for response: UNNotificationResponse) -> PushNotificationAppAction?
}

// MARK: - Default Conformances
extension PushNotificationUserResponseAction {
    public var options: UNNotificationActionOptions {
        .foreground
    }
}
