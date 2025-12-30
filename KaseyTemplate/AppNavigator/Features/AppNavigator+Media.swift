import MediaScreens
import UIKit
import UtilityModel
import UtilityScreens

extension AppNavigator {
    func makeMediaNavigator() -> MediaScreens.Navigator {
        .init(
            deps: deps.mediaScreensDeps,
            didSelectNavAction: { [weak self] navAction, navigationController in
                self?.navigate(
                    navAction: navAction,
                    with: navigationController,
                )
            }
        )
    }
    
    private func navigate(
        navAction: MediaScreens.NavAction,
        with navigationController: UINavigationController,
    ) {
        switch navAction {
        case .alert(let alertModel):
            utilityNavigator.presentAlert(
                requiredData: alertModel,
                on: navigationController,
            )
            
        case .actionSheet(let actionSheetModel):
            utilityNavigator.presentActionSheet(
                requiredData: actionSheetModel,
                on: navigationController,
            )
            
        case .dismiss(let completion):
            navigationController.dismiss(animated: true, completion: nil)
            
        case .pop:
            navigationController.popViewController(animated: true)
            
        case .website(let url):
            utilityNavigator.presentWebsite(
                url: url,
                on: navigationController
            )
        }
    }
}
