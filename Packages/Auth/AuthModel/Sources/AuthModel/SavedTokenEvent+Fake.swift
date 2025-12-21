import Foundation

extension SavedTokenEvent {
    public static func fake(
        id: UUID = UUID(),
        savedAt: Date = .now
    ) -> SavedTokenEvent {
        .init(
            id: id,
            savedAt: savedAt
        )
    }
}

