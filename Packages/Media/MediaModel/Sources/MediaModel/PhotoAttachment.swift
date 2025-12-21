import Foundation

public struct PhotoAttachment: Hashable, Codable, MediaIdentifiable, Sendable {
    public let id: PhotoAttachmentID
    public let imageURL: URL
    public var mediaIdentitifer: String {
        imageURL.absoluteString
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
    }
    
    public init(
        id: PhotoAttachmentID,
        imageURL: URL
    ) {
        self.id = id
        self.imageURL = imageURL
    }
}
