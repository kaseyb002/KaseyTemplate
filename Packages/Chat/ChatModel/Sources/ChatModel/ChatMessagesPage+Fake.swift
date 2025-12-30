import Foundation

extension ChatMessagesPage {
    public static func fake(
        total: Int = .random(in: 25 ... 1_000),
        messages: [ChatMessage] = [
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
        ],
        previous: Int? = nil,
        next: Int? = 2
    ) -> ChatMessagesPage {
        .init(
            total: total,
            messages: messages,
            previous: previous,
            next: next
        )
    }
    
    public static func appStorePage() -> ChatMessagesPage {
        .init(
            total: 100,
            messages: [
                .fake(
                    userID: .fake(),
                    displayName: "Fadi",
                    profileImageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280044/cantor_wiks7y.jpg"),
                    message: "Was that a bluff?",
                    timestamp: .now.addMinutes(-45),
                    isDeleted: false
                ),
                .fake(
                    userID: .fake(),
                    displayName: "Tyler",
                    profileImageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760889/woolf_m2a4hl.jpg"),
                    message: "Nah not today",
                    timestamp: .now.addMinutes(-30),
                    isDeleted: false
                ),
                .fake(
                    userID: .fake(),
                    displayName: "Tyler",
                    profileImageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1752760889/woolf_m2a4hl.jpg"),
                    message: "But I did yesterday with that AQJ flop",
                    timestamp: .now.addMinutes(-30).addSeconds(5),
                    isDeleted: false
                ),
                .fake(
                    userID: .fake(),
                    displayName: "Fadi",
                    profileImageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1746280044/cantor_wiks7y.jpg"),
                    message: "🤥",
                    timestamp: .now.addMinutes(-20),
                    isDeleted: false
                ),
            ],
            previous: nil,
            next: nil
        )
    }
}
