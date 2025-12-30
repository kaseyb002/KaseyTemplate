import Foundation
import UserModel

extension Optional<ChatRoomUserState> {
    public mutating func update(
        lastMessage: ChatMessage,
        myUserID: UserID
    ) {
        switch self {
        case .none:
            self = .init(
                roomID: lastMessage.roomID,
                userID: myUserID,
                lastReadMessageTimestamp: nil,
                lastMessage: lastMessage
            )
            
        case .some:
            self?.lastMessage = lastMessage
        }
    }
}
