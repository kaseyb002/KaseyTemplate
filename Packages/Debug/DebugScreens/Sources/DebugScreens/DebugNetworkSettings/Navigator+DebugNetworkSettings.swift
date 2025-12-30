import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushDebugNetworkSettings(
        requiredData: DebugNetworkSettingsViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func presentDebugNetworkSettings(
        requiredData: DebugNetworkSettingsViewRequiredData,
        on presentingViewController: UIViewController
    ) {
        let navigationController: UINavigationController = .init()
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.setViewControllers([viewController], animated: false)
        presentingViewController.present(navigationController, animated: true)
    }
    
    private func makeViewController(
        requiredData: DebugNetworkSettingsViewRequiredData,
        navigationController: UINavigationController
    ) -> UIViewController {
        let loader: DebugNetworkSettingsView.LoadingController = .init(
            dataStore: deps.dataStore,
            requiredData: requiredData
        )
        let loadingView: LoadingContainerView<DebugNetworkSettingsView.LoadingController, DebugNetworkSettingsView> = .init(
            dataLoader: loader,
            content: { [weak navigationController] model in
                let controller: DebugNetworkSettingsView.Controller = .init(
                    model: model,
                    dataStore: deps.dataStore,
                    didSelectNavAction: { [weak navigationController] action in
                        guard let navigationController else { return }
                        didSelectNavAction(action, navigationController)
                    }
                )
                return DebugNetworkSettingsView(controller: controller)
            }
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "Debug Network Settings"
        return hostingController
    }
}
