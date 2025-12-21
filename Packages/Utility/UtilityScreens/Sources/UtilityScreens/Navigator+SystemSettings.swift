import UtilityModel
import UIKit

extension Navigator {
    public func presentSystemSettings(
        on presentingViewController: UIViewController
    ) {
        guard let url: URL = .init(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url)
        else {
            presentCantOpenSettingsAlert(on: presentingViewController)
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    private func presentCantOpenSettingsAlert(
        on presentingViewController: UIViewController
    ) {
        let requiredData: AlertModel = .init(
            title: "Open Settings",
            message: "You'll need to go into iOS Settings and find the app.",
            actions: [
                .init(title: "OK", callback: {})
            ],
            includeCancel: false
        )
        presentAlert(requiredData: requiredData, on: presentingViewController)
    }
}
