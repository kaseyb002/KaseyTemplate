import Foundation
import UserModel

public struct ChatMessageReaction: Equatable, Codable, Sendable {
    public let id: ChatMessageReactionID
    public let messageID: ChatMessageID
    public let userID: UserID
    public let reactionType: String
    public let displayName: String
    public let profileImageURL: URL?
    public let timestamp: Date
    
    public enum CodingKeys: String, CodingKey {
        case id
        case messageID = "message"
        case userID = "user"
        case reactionType
        case displayName = "username"
        case profileImageURL = "imageUrl"
        case timestamp = "created"
    }
    
    public init(
        id: ChatMessageReactionID,
        messageID: ChatMessageID,
        userID: UserID,
        reactionType: String,
        displayName: String,
        profileImageURL: URL?,
        timestamp: Date
    ) {
        self.id = id
        self.messageID = messageID
        self.userID = userID
        self.reactionType = reactionType
        self.displayName = displayName
        self.profileImageURL = profileImageURL
        self.timestamp = timestamp
    }
}
