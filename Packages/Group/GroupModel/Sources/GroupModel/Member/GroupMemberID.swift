import Foundation
import UserModel

public struct GroupMemberID: Hashable, Codable, Sendable {
    public let groupID: GroupID
    public let userID: UserID
    
    public init(
        groupID: GroupID,
        userID: UserID,
    ) {
        self.groupID = groupID
        self.userID = userID
    }
}
