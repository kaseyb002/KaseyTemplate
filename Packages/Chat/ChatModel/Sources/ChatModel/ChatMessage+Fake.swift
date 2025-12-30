import Extensions
import Foundation
import MediaModel
import SampleData
import UserModel

extension ChatMessage {
    public static func fake(
        id: ChatMessageID = .fake(),
        clientID: ChatMessageID? = nil,
        roomID: ChatRoomID = .fake(),
        userID: UserID = .fake(),
        displayName: String = Lorem.fullName,
        profileImageURL: URL? = .randomImageURL,
        message: String = Lorem.sentences(.random(in: 1 ... 4)),
        timestamp: Date = .now.addingTimeInterval(.random(in: 1 ... 10_000)),
        isDeleted: Bool = false,
        attachments: [MediaAttachment] = [],
        reactionCounts: [String: Int] = [:],
        myReactions: Set<String> = []
    ) -> ChatMessage {
        .init(
            id: id,
            clientID: clientID,
            roomID: roomID,
            userID: userID,
            displayName: displayName,
            profileImageURL: profileImageURL,
            message: message,
            timestamp: timestamp,
            isDeleted: isDeleted,
            attachments: attachments,
            reactionCounts: reactionCounts,
            myReactions: myReactions
        )
    }
}
