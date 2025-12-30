import Foundation

public struct Group: Equatable, Codable, Sendable {
    public let id: GroupID
    public let created: Date
    public var name: String
    public var imageURL: URL?
    public var tagline: String?
    public var description: String?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case created
        case name
        case imageURL = "imageUrl"
        case tagline
        case description
    }
    
    public init(
        id: GroupID,
        created: Date,
        name: String,
        imageURL: URL?,
        tagline: String?,
        description: String?
    ) {
        self.id = id
        self.created = created
        self.name = name
        self.imageURL = imageURL
        self.tagline = tagline
        self.description = description
    }
}
