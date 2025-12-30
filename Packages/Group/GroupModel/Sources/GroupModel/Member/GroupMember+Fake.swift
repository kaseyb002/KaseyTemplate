import Extensions
import Foundation
import SampleData
import UserModel

extension GroupMember {
    public static func fake(
        groupID: GroupID = .fake(),
        userID: UserID = .fake(),
        created: Date = Date().addingTimeInterval(-1 * .random(in: 1 ... 100_000)),
        username: String = Lorem.word.lowercased(),
        imageURL: URL? = .randomImageURL,
        isDeleted: Bool = false,
        permissions: Set<GroupPermission> = Set(GroupPermission.allCases.randomBunch()),
    ) -> GroupMember {
        .init(
            groupID: groupID,
            userID: userID,
            created: created,
            username: username,
            imageURL: imageURL,
            isDeleted: isDeleted,
            permissions: permissions,
        )
    }
    
    public static func appStoreGroupMember() -> GroupMember {
        .init(
            groupID: .init(rawValue: "1"),
            userID: .init(rawValue: "7"),
            created: .now,
            username: "Kasey",
            imageURL: .randomImageURL,
            isDeleted: false,
            permissions: Set(GroupPermission.allCases),
        )
    }
}
