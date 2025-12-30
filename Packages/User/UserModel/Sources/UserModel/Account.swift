import Foundation

public struct Account: Hashable, Codable, Sendable {
    public let id: AccountID
    public var imageURL: URL?
    public var bio: String?
    
    public enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case bio
    }
    
    public init(
        id: AccountID,
        imageURL: URL?,
        bio: String?,
    ) {
        self.id = id
        self.imageURL = imageURL
        self.bio = bio
    }
}
