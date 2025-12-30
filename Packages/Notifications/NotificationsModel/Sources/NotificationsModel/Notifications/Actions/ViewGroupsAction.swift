import Foundation
@preconcurrency import UserNotifications

public struct ViewGroupsAction: PushNotificationUserResponseAction, Sendable {
    public let actionID: PushNotificationUserResponseActionID = .viewGroups
    public let title: String = "Go to group"
    
    public init() {
        
    }
    
    public func action(for response: UNNotificationResponse) -> PushNotificationAppAction? {
        .viewGroups
    }
}
