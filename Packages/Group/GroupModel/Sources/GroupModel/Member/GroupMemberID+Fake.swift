import Foundation
import Extensions
import UserModel

extension GroupMemberID {
    public static func fake(
        groupID: GroupID = .fake(),
        userID: UserID = .fake(),
    ) -> GroupMemberID {
        .init(
            groupID: groupID,
            userID: userID
        )
    }
}
