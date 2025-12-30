import Foundation

public struct GroupMembersPage: Equatable, Decodable, Sendable {
    public let total: Int
    public let groupMembers: [GroupMember]
    public let previous: Int?
    public let next: Int?
    
    public enum CodingKeys: String, CodingKey {
        case total = "count"
        case groupMembers = "results"
        case previous
        case next
    }
    
    public init(
        total: Int,
        groupMembers: [GroupMember],
        previous: Int?,
        next: Int?
    ) {
        self.total = total
        self.groupMembers = groupMembers
        self.previous = previous
        self.next = next
    }
}
