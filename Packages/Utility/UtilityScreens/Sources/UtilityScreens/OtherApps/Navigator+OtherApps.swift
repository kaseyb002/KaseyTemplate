import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushOtherApps(
        requiredData: OtherAppsViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        navigationController.pushViewController(viewController, animated: true)
    }

    public func presentOtherApps(
        requiredData: OtherAppsViewRequiredData,
        on presentingViewController: UIViewController
    ) {
        let navigationController: UINavigationController = .init()
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: true
        )
        navigationController.setViewControllers([viewController], animated: false)
        presentingViewController.present(navigationController, animated: true)
    }
    
    private func makeViewController(
        requiredData: OtherAppsViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<OtherAppsView, OtherAppsView.Model> = .init(
            requiredData: requiredData,
            deps: .init(
                dataStore: deps.dataStore,
                didSelectNavAction: { [weak navigationController] action in
                    guard let navigationController: UINavigationController else { return }
                    didSelectNavAction(action, navigationController)
                }
            ),
            dataStore: deps.dataStore,
            isPresentedModally: isPresentedModally
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "Other Apps"
        return hostingController
    }
}
