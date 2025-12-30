import Foundation

extension GroupMembersPage {
    public static func fake(
        total: Int = .random(in: 25 ... 1_000),
        groupMembers: [GroupMember] = [
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
            .fake(),
        ],
        previous: Int? = nil,
        next: Int? = 2,
    ) -> GroupMembersPage {
        .init(
            total: total,
            groupMembers: groupMembers,
            previous: previous,
            next: next,
        )
    }
}
