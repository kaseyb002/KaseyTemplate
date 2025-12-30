import Extensions
import Foundation
import GroupModel

public struct EditGroupNotificationSettingsForm: Equatable, Encodable, Sendable {
    public let groupID: GroupID
    public var newMemberJoined: Bool?

    public init(
        groupID: GroupID,
        newMemberJoined: Bool? = nil,
    ) {
        self.groupID = groupID
        self.newMemberJoined = newMemberJoined
    }
}
