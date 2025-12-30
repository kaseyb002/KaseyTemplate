import Foundation

public struct ChatMessageReactionsPage: Equatable, Decodable, Sendable {
    public let total: Int
    public let reactions: [ChatMessageReaction]
    public let previous: Int?
    public let next: Int?
    
    public enum CodingKeys: String, CodingKey {
        case total = "count"
        case reactions = "results"
        case previous
        case next
    }
    
    public init(
        total: Int,
        reactions: [ChatMessageReaction],
        previous: Int?,
        next: Int?
    ) {
        self.total = total
        self.reactions = reactions
        self.previous = previous
        self.next = next
    }
}

