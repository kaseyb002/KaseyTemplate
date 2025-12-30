import UIKit
import UtilityModel
import UtilityScreens

extension AppNavigator {
    func makeUtilityNavigator() -> UtilityScreens.Navigator {
        .init(
            deps: deps.utilityScreensDeps,
            didSelectNavAction: { [weak self] navAction, navigationController in
                self?.navigate(
                    navAction: navAction,
                    with: navigationController,
                )
            }
        )
    }
    
    private func navigate(
        navAction: UtilityScreens.NavAction,
        with navigationController: UINavigationController,
    ) {
        switch navAction {
        case .dismiss:
            navigationController.dismiss(animated: true)

        case .website(let url):
            utilityNavigator.presentWebsite(
                url: url,
                on: navigationController,
            )
        }
    }
}
