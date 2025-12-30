import Foundation
import GroupModel
import UserModel
@preconcurrency import UserNotifications

public struct ViewGroupMemberAction: PushNotificationUserResponseAction, Sendable {
    public let actionID: PushNotificationUserResponseActionID = .viewGroupMember
    public let title: String = "View profile"
    
    public init() {
        
    }
    
    public func action(for response: UNNotificationResponse) -> PushNotificationAppAction? {
        guard let userID: UserID = response.notification.id(UserID.self, for: .userID),
              let groupID: GroupID = response.notification.id(GroupID.self, for: .groupID)
        else {
            return nil
        }
        let groupMemberID: GroupMemberID = .init(groupID: groupID, userID: userID)
        return .viewGroupMember(groupMemberID)
    }
}
