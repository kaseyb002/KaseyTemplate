import Foundation

extension PushNotificationAppAction {
    public var displayTitle: String {
        switch self {
        case .viewGroupMember:
            return "View Group Member"
            
        case .viewGroups:
            return "View Groups"
            
        case .viewGroup:
            return "View Group"
        }
    }

    public var logDescription: String {
        switch self {
        case .viewGroupMember(let groupMemberID):
            "viewGroupMember groupID: \(groupMemberID.groupID) userID: \(groupMemberID.userID)"

        case .viewGroups:
            "viewGroups"
            
        case .viewGroup(let groupID):
            "viewGroup groupID: \(groupID)"
        }
    }
}
