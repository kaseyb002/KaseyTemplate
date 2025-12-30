import Foundation
import Extensions

public struct GroupSettings: Equatable, Codable, Sendable {
    public let groupID: GroupID
    public var audioChannelID: String?
    public var backgroundImageURL: URL?

    public enum CodingKeys: String, CodingKey {
        case groupID = "group"
        case audioChannelID = "audioChannelId"
        case backgroundImageURL = "backgroundImageUrl"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.groupID = try container.decode(GroupID.self, forKey: .tableID)
        self.audioChannelID = try container.decodeIfPresent(String.self, forKey: .audioChannelID)
        self.backgroundImageURL = try container.decodeIfPresent(URL.self, forKey: .backgroundImageURL)
    }
    
    public init(
        groupID: GroupID,
        audioChannelID: String? = nil,
        backgroundImageURL: URL? = nil
    ) {
        self.groupID = groupID
        self.audioChannelID = audioChannelID
        self.backgroundImageURL = backgroundImageURL
    }
}
