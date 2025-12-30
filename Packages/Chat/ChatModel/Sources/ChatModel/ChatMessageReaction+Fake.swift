import Extensions
import Foundation
import SampleData
import UserModel

extension ChatMessageReaction {
    public static func fake(
        id: ChatMessageReactionID = .fake(),
        messageID: ChatMessageID = .fake(),
        userID: UserID = .fake(),
        reactionType: String = ["👍", "❤️", "😂", "😮", "😢", "🙌", "🔥"].randomElement()!,
        displayName: String = Lorem.fullName,
        profileImageURL: URL? = .randomImageURL,
        timestamp: Date = .now.addingTimeInterval(.random(in: 1 ... 10_000))
    ) -> ChatMessageReaction {
        .init(
            id: id,
            messageID: messageID,
            userID: userID,
            reactionType: reactionType,
            displayName: displayName,
            profileImageURL: profileImageURL,
            timestamp: timestamp
        )
    }
}

