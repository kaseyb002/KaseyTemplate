import Foundation
import SampleData

extension GroupsPage {
    public static func fake(
        total: Int = .random(in: 25 ... 1_000),
        groups: [Group] = [
            .fake(),
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
    ) -> GroupsPage {
        .init(
            total: total,
            groups: groups,
            previous: previous,
            next: next
        )
    }
}
