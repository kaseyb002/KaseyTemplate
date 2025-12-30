import Foundation
import UserModel

public struct GroupInvite: Equatable, Decodable, Sendable {
    public let id: GroupInviteID
    public let groupID: GroupID
    public let sponsorUserID: UserID
    public let code: String
    public var lifetime: Lifetime
    public let created: Date
    public let inviteURL: URL
    
    public enum Lifetime: Equatable, Decodable, Sendable {
        case oneTime(usedBy: UsedByMetadata?)
        case permanent
        
        public struct UsedByMetadata: Equatable, Decodable, Sendable {
            public let userID: UserID
            public let username: String
            public let imageURL: URL?
        }
        
        public var isOneTime: Bool {
            switch self {
            case .oneTime:
                true
                
            case .permanent:
                false
            }
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case groupID = "group"
        case sponsorUserID = "createdBy"
        case code
        case lifetime
        case isOneTime
        case usedBy
        case usedByUsername
        case usedByImageUrl
        case created
        case inviteURL = "inviteUrl"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(GroupInviteID.self, forKey: .id)
        self.groupID = try container.decode(GroupID.self, forKey: .groupID)
        self.sponsorUserID = try container.decode(UserID.self, forKey: .sponsorUserID)
        self.code = try container.decode(String.self, forKey: .code)
        let isOneTime: Bool = try container.decode(Bool.self, forKey: .isOneTime)
        if isOneTime {
            if let usedBy: UserID = try container.decodeIfPresent(UserID.self, forKey: .usedBy),
               let username: String = try container.decodeIfPresent(String.self, forKey: .usedByUsername) {
                let metadata: Lifetime.UsedByMetadata = .init(
                    userID: usedBy,
                    username: username,
                    imageURL: try container.decodeIfPresent(URL.self, forKey: .usedByImageUrl)
                )
                self.lifetime = .oneTime(usedBy: metadata)
            } else {
                self.lifetime = .oneTime(usedBy: nil)
            }
        } else {
            self.lifetime = .permanent
        }
        self.created = try container.decode(Date.self, forKey: .created)
        self.inviteURL = try container.decode(URL.self, forKey: .inviteURL)
    }
 
    public init(
        id: GroupInviteID,
        groupID: GroupID,
        sponsorUserID: UserID,
        code: String,
        lifetime: Lifetime,
        created: Date,
        inviteURL: URL,
    ) {
        self.id = id
        self.groupID = groupID
        self.sponsorUserID = sponsorUserID
        self.code = code
        self.lifetime = lifetime
        self.created = created
        self.inviteURL = inviteURL
    }
}
