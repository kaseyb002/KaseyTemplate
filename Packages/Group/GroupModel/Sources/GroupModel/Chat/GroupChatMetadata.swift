import ChatModel
import Foundation

public struct GroupChatMetadata: Equatable, Codable, Sendable {
    public let groupID: GroupID
    public let roomID: ChatRoomID
    public let groupName: String
    public var lastReadMessageTimestamp: Date?
    
    public enum CodingKeys: String, CodingKey {
        case groupID = "group"
        case roomID = "room"
        case groupName
        case lastReadMessageTimestamp
    }
    
    public init(
        groupID: GroupID,
        roomID: ChatRoomID,
        groupName: String,
        lastReadMessageTimestamp: Date?,
    ) {
        self.groupID = groupID
        self.roomID = roomID
        self.groupName = groupName
        self.lastReadMessageTimestamp = lastReadMessageTimestamp
    }
}
