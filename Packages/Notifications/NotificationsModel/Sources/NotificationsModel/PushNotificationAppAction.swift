import Foundation
import GroupModel

public enum PushNotificationAppAction: Sendable {
    case viewGroups
    case viewGroupMember(GroupMemberID)
    case viewGroup(GroupID)
}
