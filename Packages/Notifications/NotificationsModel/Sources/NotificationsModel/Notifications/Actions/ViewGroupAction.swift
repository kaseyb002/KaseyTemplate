import Foundation
import GroupModel
@preconcurrency import UserNotifications

public struct ViewGroupAction: PushNotificationUserResponseAction, Sendable {
    public let actionID: PushNotificationUserResponseActionID = .viewGroup
    public let title: String = "View group"
    
    public init() {
        
    }
    
    public func action(for response: UNNotificationResponse) -> PushNotificationAppAction? {
        guard let groupID: GroupID = response.notification.id(GroupID.self, for: .groupID) else {
            return nil
        }
        return .viewGroup(groupID)
    }
}
