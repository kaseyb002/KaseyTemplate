import GiphyUISDK
import MediaModel
import CoreUI
import SwiftUI

extension Navigator {
    public func presentSelectGiphy(
        requiredData: SelectGiphyRequiredData,
        on presentingViewController: UIViewController
    ) {
        let viewController: GiphyViewController = .init()
        viewController.rating = .ratedG
        viewController.mediaTypeConfig = [
            .recents,
            .gifs,
        ]
        viewController.delegate = giphyDelegate
        giphyDelegate.didSelectGiphyMedia = requiredData.didSelectGiphy
        viewController.sheetPresentationController?.detents = [
            .large(),
        ]
        presentingViewController.present(viewController, animated: true, completion: nil)
    }
}
