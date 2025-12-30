import Extensions
import Foundation
import SampleData

extension Group {
    public static func fake(
        id: GroupID = .fake(),
        name: String = String(Lorem.title.prefix(20)),
        created: Date = .now,
        imageURL: URL? = .randomImageURL,
        tagline: String? = Lorem.words(4),
        description: String? = Lorem.paragraph,
    ) -> Group {
        .init(
            id: id,
            created: created,
            name: name,
            imageURL: imageURL,
            tagline: tagline,
            description: description
        )
    }
    
    public static func appStoreGroup(
        id: String = "1",
        name: String = "Scott's Group",
        imageURL: URL? = URL(string: "https://res.cloudinary.com/eggler/image/upload/v1748741555/bv5gkqczylwl06hh0odh.jpg")
    ) -> Group {
        .init(
            id: .init(rawValue: id),
            created: .now,
            name: name,
            imageURL: imageURL,
            tagline: nil,
            description: nil
        )
    }
    
    public static func dawgHouse() -> Group {
        .fake(
            name: "Dawg House",
            imageURL: .init(string: "https://pub-f02a5af91b4f47e9ac7cddf423e0d781.r2.dev/images/64fe0778b27353f59d624dc1bf804aa8.jpg"),
            tagline: "No Limit 24/7",
            description: "Slow poker during the week. Live poker each Friday 7pm EST."
        )
    }
    
    public static func byuSports() -> Group {
        .fake(
            name: "BYU Sports",
            imageURL: .init(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/BYU_Cougars_logo.svg/330px-BYU_Cougars_logo.svg.png"),
            tagline: "Is the world ready?",
            description: "HQ for BYU Sports fans. We play during every BYU football and basketball game."
        )
    }
}
