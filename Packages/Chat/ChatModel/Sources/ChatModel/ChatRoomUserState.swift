import Extensions
import Foundation
import SampleData
import UserModel

public struct ChatRoomUserState: Equatable, Codable, Sendable {
    public let roomID: ChatRoomID
    public let userID: UserID
    public var lastReadMessageTimestamp: Date?
    public var lastMessage: ChatMessage?
    public var unreadStatus: UnreadStatus {
        guard let lastMessage: ChatMessage,
              lastMessage.userID != userID
        else {
            return .allRead
        }
        
        guard let lastReadMessageTimestamp: Date else {
            return .hasUnread(lastMessage)
        }
    
        if lastMessage.timestamp > lastReadMessageTimestamp {
            return .hasUnread(lastMessage)
        } else {
            return .allRead
        }
    }

    public enum UnreadStatus: Equatable, Codable {
        case hasUnread(ChatMessage)
        case allRead
        
        public var isUnread: Bool {
            switch self {
            case .hasUnread:
                true
                
            case .allRead:
                false
            }
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case roomID = "room"
        case userID = "user"
        case lastReadMessageTimestamp
        case lastMessage
    }
    
    public init(
        roomID: ChatRoomID,
        userID: UserID,
        lastReadMessageTimestamp: Date?,
        lastMessage: ChatMessage?
    ) {
        self.roomID = roomID
        self.userID = userID
        self.lastReadMessageTimestamp = lastReadMessageTimestamp
        self.lastMessage = lastMessage
    }
}
