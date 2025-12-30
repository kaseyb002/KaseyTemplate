import Foundation
import Extensions

extension GroupSettings {
    public static func fake(
        groupID: GroupID = .fake(),
        audioChannelID: String? = nil,
        backgroundImageURL: URL? = nil,
    ) -> GroupSettings {
        .init(
            groupID: groupID,
            audioChannelID: audioChannelID,
            backgroundImageURL: backgroundImageURL
        )
    }
    
    public static func appStoreGroupSettings() -> GroupSettings {
        .init(
            groupID: .init(rawValue: "1"),
            audioChannelID: nil,
            backgroundImageURL: URL(string: "https://res.cloudinary.com/eggler/image/upload/v1744984762/alps_uhv26s.jpg")
        )
    }
}
