import Foundation

public enum PushNotificationUserResponseActionID: String, Sendable, CaseIterable {
    case viewGroups = "VIEW_GROUPS"
    case viewGroup = "VIEW_GROUP"
    case viewGroupMember = "VIEW_GROUP_MEMBER"
}
