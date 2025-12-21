import GiphyUISDK
import MediaModel
import UIKit

final class DefaultGiphyDelegate: GiphyDelegate {
    var didSelectGiphyMedia: ((GiphyMedia) -> Void)?

    func didSelectMedia(
        giphyViewController: GiphyViewController,
        media: GPHMedia
    ) {
        if let urlString = media.url(rendition: .original, fileType: .gif),
           let url = URL(string: urlString) {
            let giphyMedia: MediaModel.GiphyMedia = .init(
                giphyID: media.id,
                giphyURL: url
            )
            didSelectGiphyMedia?(giphyMedia)
        }
        giphyViewController.dismiss(animated: true)
    }

    func didDismiss(
        controller: GiphyUISDK.GiphyViewController?
    ) {
        didSelectGiphyMedia = nil
    }
}
