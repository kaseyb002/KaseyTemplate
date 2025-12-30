import Foundation

extension ChatMessageReactionsPage {
    public static func fake(
        total: Int = .random(in: 1 ... 50),
        reactions: [ChatMessageReaction] = [
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
        ],
        previous: Int? = nil,
        next: Int? = 2
    ) -> ChatMessageReactionsPage {
        .init(
            total: total,
            reactions: reactions,
            previous: previous,
            next: next
        )
    }
}

