import Foundation

public enum ChatMessageAction: Sendable {
    case deleteTapped
    case copyTextTapped
    case addReactionTapped(reactionType: String)
    case addOtherReactionTapped
}

