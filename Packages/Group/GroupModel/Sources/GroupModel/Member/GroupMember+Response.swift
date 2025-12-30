import Foundation

extension GroupMember {
    public init(response: GroupMemberResponse) {
        self.init(
            groupID: response.groupID,
            userID: response.userID,
            created: response.created,
            username: response.username,
            imageURL: response.imageURL,
            isDeleted: response.isDeleted,
            permissions: .init(response: response.permissions),
        )
    }
}
