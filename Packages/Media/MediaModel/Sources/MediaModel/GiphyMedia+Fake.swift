import Extensions
import Foundation

extension GiphyMedia {
    public static func fake(
        giphyID: String = UUID().uuidString,
        giphyURL: URL = .randomImageURL
    ) -> GiphyMedia {
        .init(
            giphyID: giphyID,
            giphyURL: giphyURL
        )
    }
}
