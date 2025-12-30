import LaunchApp
import UIKit

extension AppNavigator {
    func handle(
        launchApp action: LaunchApp.NavAction<LaunchAppRequiredData>,
        navigationController: UINavigationController
    ) {
        switch action {
        case .launchApp(let appRequiredData):
            let viewController: UIViewController = .init()
            viewController.view.backgroundColor = .blue
            navigationController.present(viewController, animated: true)
            
        case .getHelp:
            break // TODO
        }
    }
}
