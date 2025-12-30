import Foundation

public struct ChatMessagesPage: Equatable, Decodable, Sendable {
    public let total: Int
    public let messages: [ChatMessage]
    public let previous: Int?
    public let next: Int?
    
    public enum CodingKeys: String, CodingKey {
        case total = "count"
        case messages = "results"
        case previous
        case next
    }
    
    public init(
        total: Int,
        messages: [ChatMessage],
        previous: Int?,
        next: Int?
    ) {
        self.total = total
        self.messages = messages
        self.previous = previous
        self.next = next
    }
}
