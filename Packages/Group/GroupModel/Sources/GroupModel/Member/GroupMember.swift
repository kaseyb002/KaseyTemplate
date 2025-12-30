import Extensions
import Foundation
import UserModel

public struct GroupMember: Equatable, Codable, Sendable {
    public let groupID: GroupID
    public let userID: UserID
    public let created: Date
    public var username: String
    public var imageURL: URL?
    public var isDeleted: Bool
    public var permissions: Set<GroupPermission>
    public var groupMemberID: GroupMemberID {
        .init(
            groupID: groupID,
            userID: userID,
        )
    }
    public var displayName: String {
        username
    }
    
    public enum CodingKeys: String, CodingKey {
        case groupID = "group"
        case userID = "user"
        case username
        case created
        case isDeleted
        case imageURL = "imageUrl"
        case permissions
    }
    
    public init(
        groupID: GroupID,
        userID: UserID,
        created: Date,
        username: String,
        imageURL: URL?,
        isDeleted: Bool,
        permissions: Set<GroupPermission>
    ) {
        self.groupID = groupID
        self.userID = userID
        self.created = created
        self.username = username
        self.imageURL = imageURL
        self.isDeleted = isDeleted
        self.permissions = permissions
    }
}
