import Foundation

public struct GroupNotificationSettings: Hashable, Decodable, Sendable {
    public var newMemberJoined: Bool
    
    public init(
        newMemberJoined: Bool,
    ) {
        self.newMemberJoined = newMemberJoined
    }
}
