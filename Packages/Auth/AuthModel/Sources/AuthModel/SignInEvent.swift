import Foundation

/// Used to record when the user signed in.
/// If the user deletes the app, then this should be deleted wherever it's stored.
/// The absence of this indicates they are not logged in.
public struct SavedTokenEvent: Codable, Equatable, Sendable {
    public let id: UUID
    public let savedAt: Date
    
    public init(
        id: UUID,
        savedAt: Date
    ) {
        self.id = id
        self.savedAt = savedAt
    }
}
