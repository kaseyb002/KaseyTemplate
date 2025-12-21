import Foundation

public struct GiphyAttachment: Hashable, Codable, MediaIdentifiable, Sendable {
    public let id: GiphyAttachmentID
    public let giphyID: String
    public let giphyURL: URL
    public var mediaIdentitifer: String {
        giphyURL.absoluteString
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case giphyID = "giphyId"
        case giphyURL = "giphyUrl"
    }
    
    public init(
        id: GiphyAttachmentID,
        giphyID: String,
        giphyURL: URL
    ) {
        self.id = id
        self.giphyID = giphyID
        self.giphyURL = giphyURL
    }
}
