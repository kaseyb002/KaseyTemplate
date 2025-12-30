import Foundation

public struct DefaultGroupPermissions: Equatable, Sendable {
    public let groupID: GroupID
    public var permissions: Set<GroupPermission>
    
    public init(
        groupID: GroupID,
        permissions: Set<GroupPermission>
    ) {
        self.groupID = groupID
        self.permissions = permissions
    }
}
