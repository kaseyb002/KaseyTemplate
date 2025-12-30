import Foundation

public struct GroupsPage: Equatable, Decodable, Sendable {
    public let total: Int
    public let groups: [Group]
    public let previous: Int?
    public let next: Int?
    
    public enum CodingKeys: String, CodingKey {
        case total = "count"
        case groups = "results"
        case previous
        case next
    }
    
    public init(
        total: Int,
        groups: [Group],
        previous: Int?,
        next: Int?,
    ) {
        self.total = total
        self.groups = groups
        self.previous = previous
        self.next = next
    }
}
