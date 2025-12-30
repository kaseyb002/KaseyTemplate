import Foundation

public struct MarkedRoomAsReadUpdate: Equatable, Sendable {
    public let roomID: ChatRoomID
    public let timestamp: Date
    
    public init(
        roomID: ChatRoomID,
        timestamp: Date
    ) {
        self.roomID = roomID
        self.timestamp = timestamp
    }
}
