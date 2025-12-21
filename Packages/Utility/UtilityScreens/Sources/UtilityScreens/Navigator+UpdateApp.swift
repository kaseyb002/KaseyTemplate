import UIKit
import UtilityModel

extension Navigator {
    public func presentUpdateApp(
        appID: OtherAppID,
        on presentingViewController: UIViewController
    ) {
        let appStoreURL: URL = {
            switch appID {
            case .gameNight:
                OtherApp.gameNight.appStoreURL
                
            case .noLimitHoldEm:
                OtherApp.noLimitHoldEm.appStoreURL
                
            case .fourStraight:
                OtherApp.fourStraight.appStoreURL
                
            case .stage10:
                OtherApp.stage10.appStoreURL
            }
        }()
        
        guard UIApplication.shared.canOpenURL(appStoreURL) else {
            presentCantOpenAppStoreAlert(on: presentingViewController)
            return
        }
        
        UIApplication.shared.open(appStoreURL)
    }
    
    private func presentCantOpenAppStoreAlert(
        on presentingViewController: UIViewController
    ) {
        let requiredData: AlertModel = .init(
            title: "Can't Open App Store",
            message: "You'll need to go to the App Store or TestFlight to update the app.",
            actions: [
                .init(title: "OK", callback: {})
            ],
            includeCancel: false
        )
        presentAlert(requiredData: requiredData, on: presentingViewController)
    }
}
