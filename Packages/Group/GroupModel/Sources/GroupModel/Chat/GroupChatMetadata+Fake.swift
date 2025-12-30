import ChatModel
import Extensions
import Foundation
import SampleData

extension GroupChatMetadata {
    public static func fake(
        groupID: GroupID = .fake(),
        roomID: ChatRoomID = .fake(),
        groupName: String = Lorem.words(.random(in: 1 ... 3)),
        lastReadMessageTimestamp: Date? = nil,
    ) -> GroupChatMetadata {
        .init(
            groupID: groupID,
            roomID: roomID,
            groupName: groupName,
            lastReadMessageTimestamp: lastReadMessageTimestamp,
        )
    }
}
