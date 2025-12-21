import UIKit

public struct MediaUpload: Hashable, MediaIdentifiable, Sendable {
    public let uploadType: MediaUploadType
    public let uploadStarted: Date
    public let clientID: MediaAttachmentID = .fake()
    public var mediaIdentitifer: String { uploadType.mediaIdentitifer }

    public enum MediaUploadType: Hashable, MediaIdentifiable, Sendable  {
        case giphy(GiphyMedia)
        case image(UIImage)
        
        public var mediaIdentitifer: String {
            switch self {
            case .giphy(let giphyMedia):
                return giphyMedia.giphyURL.absoluteString
                
            case .image(let uiImage):
                return String(uiImage.hash)
            }
        }
    }
    
    public init(
        uploadType: MediaUploadType,
        uploadStarted: Date
    ) {
        self.uploadType = uploadType
        self.uploadStarted = uploadStarted
    }
}
