import Foundation

public struct GroupInvitesPage: Equatable, Decodable, Sendable {
    public let total: Int
    public let groupInvites: [GroupInvite]
    public let previous: Int?
    public let next: Int?
    
    public enum CodingKeys: String, CodingKey {
        case total = "count"
        case groupInvites = "results"
        case previous
        case next
    }
    
    public init(
        total: Int,
        groupInvites: [GroupInvite],
        previous: Int?,
        next: Int?,
    ) {
        self.total = total
        self.groupInvites = groupInvites
        self.previous = previous
        self.next = next
    }
}
