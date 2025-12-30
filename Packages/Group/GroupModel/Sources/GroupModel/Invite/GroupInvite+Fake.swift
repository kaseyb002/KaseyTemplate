import Extensions
import Foundation
import SampleData
import UserModel

extension GroupInvite {
    public static func fake(
        id: GroupInviteID = .fake(),
        groupID: GroupID = .fake(),
        sponsorID: UserID = .fake(),
        code: String = Lorem.word.lowercased(),
        lifetime: Lifetime = Bool.random(withProbability: 0.5) ? .oneTime(usedBy: nil) : .permanent,
        created: Date = .now,
        inviteURL: URL? = nil,
    ) -> GroupInvite {
        .init(
            id: id,
            groupID: groupID,
            sponsorUserID: sponsorID,
            code: code,
            lifetime: lifetime,
            created: created,
            inviteURL: inviteURL ?? URL(string: "https://queen3.app/tables/join?code=\(code)")!,
        )
    }
}
