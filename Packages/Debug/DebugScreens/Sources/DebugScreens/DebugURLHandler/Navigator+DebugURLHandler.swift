import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushDebugURLHandler(
        requiredData: DebugURLHandlerViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        navigationController.pushViewController(viewController, animated: true)
    }

    public func presentDebugURLHandler(
        requiredData: DebugURLHandlerViewRequiredData,
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
        requiredData: DebugURLHandlerViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<DebugURLHandlerView, DebugURLHandlerView.Model> = .init(
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
        hostingController.title = "Debug URL Handler"
        return hostingController
    }
}
