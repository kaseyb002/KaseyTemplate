import Extensions
import Foundation

extension PhotoAttachment {
    public static func fake(
        id: PhotoAttachmentID = .fake(),
        imageURL: URL = .randomImageURL
    ) -> PhotoAttachment {
        .init(
            id: id,
            imageURL: imageURL
        )
    }
}

