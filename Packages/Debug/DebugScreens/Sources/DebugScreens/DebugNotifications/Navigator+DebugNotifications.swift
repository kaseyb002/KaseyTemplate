import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushDebugNotifications(
        requiredData: DebugNotificationsViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: DebugNotificationsViewRequiredData,
        navigationController: UINavigationController
    ) -> UIViewController {
        let loader: DebugNotificationsView.LoadingController = .init(
            dataStore: deps.dataStore,
            requiredData: requiredData
        )
        let loadingView: LoadingContainerView<DebugNotificationsView.LoadingController, DebugNotificationsView> = .init(
            dataLoader: loader,
            content: { [weak navigationController] model in
                let controller: DebugNotificationsView.Controller = .init(
                    model: model,
                    dataStore: deps.dataStore,
                    didSelectNavAction: { [weak navigationController] action in
                        guard let navigationController else { return }
                        didSelectNavAction(action, navigationController)
                    }
                )
                return DebugNotificationsView(controller: controller)
            }
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "Debug Notifications"
        return hostingController
    }
}
