import Extensions
import Foundation
import SampleData

extension Account {
    public static func fake(
        id: AccountID = .fake(),
        imageURL: URL? = Bool.random(withProbability: 0.9) ? .randomImageURL : nil,
        bio: String? = Bool.random(withProbability: 0.7) ? Lorem.sentences(1...5) : nil,
    ) -> Account {
        .init(
            id: id,
            imageURL: imageURL,
            bio: bio
        )
    }
    
    public static func staticFake(
        id: AccountID = .init(rawValue: "8a97c338-b556-11ed-afa1-0242ac120002"),
        imageURL: URL? = .fakeImageURL,
        bio: String? = .loremPassageStandard,
    ) -> Account {
        .init(
            id: id,
            imageURL: imageURL,
            bio: bio
        )
    }
}
