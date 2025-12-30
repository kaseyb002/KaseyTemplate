import Foundation

extension GroupInvitesPage {
    public static func fake(
        total: Int = .random(in: 25 ... 1_000),
        groupInvites: [GroupInvite] = [
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
    ) -> GroupInvitesPage {
        .init(
            total: total,
            groupInvites: groupInvites,
            previous: previous,
            next: next,
        )
    }
}
