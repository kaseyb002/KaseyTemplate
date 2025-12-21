import UIKit
import UtilityModel

extension Navigator {
    public func presentActionSheet(
        requiredData: ActionSheetModel,
        on presentingViewController: UIViewController
    ) {
        let alert: UIAlertController = .init(
            title: requiredData.title,
            message: requiredData.message,
            preferredStyle: .actionSheet
        )

        requiredData.actions.forEach { alert.addAction($0) }
        
        let cancelAction: UIAlertAction = .init(title: "Cancel", style: .cancel) {}
        alert.addAction(cancelAction)
        
        if let popoverController: UIPopoverPresentationController = alert.popoverPresentationController {
            popoverController.sourceView = requiredData.sourceView
            popoverController.permittedArrowDirections = .any
        }
        
        presentingViewController.present(alert, animated: true)
    }
}
