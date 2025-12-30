import Extensions
import Foundation
import SampleData

extension User {
    public static func fake(
        id: UserID = .fake(),
        username: String = Lorem.word.lowercased(),
        email: String = Lorem.emailAddress,
        dateJoined: Date = .now.addDays(-1 * Int.random(in: 1 ... 200)),
        account: Account? = .fake(),
    ) -> User {
        .init(
            id: id,
            username: username,
            email: email,
            dateJoined: dateJoined,
            account: account,
        )
    }
    
    public static func staticFake(
        id: UserID = .init(rawValue: "c7ad777e-7f9f-4058-9730-8ba9606f83f3"),
        username: String = "testuser",
        email: String = "test@example.com",
        dateJoined: Date = .now.addDays(-30),
        account: Account? = .staticFake(),
    ) -> User {
        .init(
            id: id,
            username: username,
            email: email,
            dateJoined: dateJoined,
            account: account,
        )
    }
}
