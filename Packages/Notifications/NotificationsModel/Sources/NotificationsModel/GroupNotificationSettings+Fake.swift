import Foundation

extension GroupNotificationSettings {
    public static func fake(
        newMemberJoined: Bool = .random(),
    ) -> GroupNotificationSettings {
        .init(
            newMemberJoined: newMemberJoined,
        )
    }
}
