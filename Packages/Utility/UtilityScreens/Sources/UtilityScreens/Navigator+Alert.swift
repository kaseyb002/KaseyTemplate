import UIKit
import UtilityModel

extension Navigator {
    public func presentAlert(
        requiredData: AlertModel,
        on presentingViewController: UIViewController
    ) {
        let alert: UIAlertController = .init(
            title: requiredData.title,
            message: requiredData.message,
            preferredStyle: .alert
        )
        
        if requiredData.includeCancel {
            alert.addAction(.init(
                title: "Cancel",
                style: .cancel,
                callback: {}
            ))
        }
        
        requiredData.actions.forEach { alert.addAction($0) }
        
        if let popoverController: UIPopoverPresentationController = alert.popoverPresentationController {
            popoverController.sourceView = presentingViewController.view
            popoverController.permittedArrowDirections = .any
        }
        
        presentingViewController.present(alert, animated: true)
    }
}
