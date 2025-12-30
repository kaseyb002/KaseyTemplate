import Extensions
import Foundation
import SampleData
import UserModel

extension ChatRoomUserState {
    public static func fake(
        roomID: ChatRoomID = .fake(),
        userID: UserID = .fake(),
        lastReadMessageTimestamp: Date? = nil,
        lastMessage: ChatMessage? = nil
    ) -> ChatRoomUserState {
        .init(
            roomID: roomID,
            userID: userID,
            lastReadMessageTimestamp: lastReadMessageTimestamp,
            lastMessage: lastMessage
        )
    }
}
