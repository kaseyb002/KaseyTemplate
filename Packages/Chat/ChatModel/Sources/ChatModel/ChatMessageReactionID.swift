import Foundation
import Extensions

public struct ChatMessageReactionID: EntityID, Sendable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

