import Extensions
import Foundation

extension DefaultGroupPermissions {
    public static func fake(
        groupID: GroupID = .fake(),
        permissions: Set<GroupPermission> = Set(GroupPermission.allCases),
    ) -> DefaultGroupPermissions {
        .init(
            groupID: groupID,
            permissions: permissions
        )
    }
}
