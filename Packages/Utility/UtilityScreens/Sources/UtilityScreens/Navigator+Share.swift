import UtilityModel
import SwiftUI

extension Navigator {
    public func presentShare(
        requiredData: ShareModel,
        on presentingViewController: UIViewController
    ) {
        let activityViewController: UIActivityViewController = UIActivityViewController(
            activityItems: requiredData.activityItems,
            applicationActivities: nil
        )
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = presentingViewController.view
            popoverController.sourceRect = CGRect(
                x: presentingViewController.view.bounds.midX,
                y: presentingViewController.view.bounds.midY,
                width: 0,
                height: 0
            )
            popoverController.permittedArrowDirections = []
        }
        presentingViewController.present(activityViewController, animated: true)
    }
}

