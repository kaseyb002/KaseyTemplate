import Foundation

public struct GroupBackground: Equatable, Decodable, Sendable {
    public let id: String
    public let title: String
    public let imageURL: URL
    
    public init(
        id: String,
        title: String,
        imageURL: URL
    ) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL = "imageUrl"
    }
}
