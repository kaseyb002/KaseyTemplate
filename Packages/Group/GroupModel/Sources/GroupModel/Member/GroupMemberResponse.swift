import Foundation
import Extensions
import UserModel

/// Used mainly for converting permissions into a Set
public struct GroupMemberResponse: Equatable, Decodable, Sendable {
    public let groupID: GroupID
    public let userID: UserID
    public let created: Date
    public let username: String
    public let imageURL: URL?
    public let permissions: PermissionsResponse
    public let isDeleted: Bool
    
    public enum CodingKeys: String, CodingKey {
        case groupID = "group"
        case userID = "user"
        case username
        case created
        case imageURL = "imageUrl"
        case permissions
        case isDeleted
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.groupID = try container.decode(GroupID.self, forKey: .tableID)
        self.userID = try container.decode(UserID.self, forKey: .userID)
        self.permissions = try container.decode(PermissionsResponse.self, forKey: .permissions)
        self.username = try container.decode(String.self, forKey: .username)
        self.imageURL = try container.decodeIfPresent(URL.self, forKey: .imageURL)
        self.isDeleted = try container.decode(Bool.self, forKey: .isDeleted)
        self.created = try container.decode(Date.self, forKey: .created)
    }
}
