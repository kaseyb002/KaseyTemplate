import Extensions
import Foundation

extension GiphyAttachment {
    public static func fake(
        id: GiphyAttachmentID = .fake(),
        giphyID: String = UUID().uuidString,
        giphyURL: URL = .randomImageURL
    ) -> GiphyAttachment {
        .init(
            id: id,
            giphyID: giphyID,
            giphyURL: giphyURL
        )
    }
}

