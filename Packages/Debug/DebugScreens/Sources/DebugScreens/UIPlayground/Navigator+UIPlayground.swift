import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushUIPlayground(
        requiredData: UIPlaygroundViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: UIPlaygroundViewRequiredData,
        navigationController: UINavigationController
    ) -> UIViewController {
        let loader: UIPlaygroundView.LoadingController = .init(
            dataStore: deps.dataStore,
            requiredData: requiredData
        )
        let loadingView: LoadingContainerView<UIPlaygroundView.LoadingController, UIPlaygroundView> = .init(
            dataLoader: loader,
            content: { [weak navigationController] model in
                let controller: UIPlaygroundView.Controller = .init(
                    model: model,
                    dataStore: deps.dataStore,
                    didSelectNavAction: { [weak navigationController] action in
                        guard let navigationController else { return }
                        didSelectNavAction(action, navigationController)
                    }
                )
                return UIPlaygroundView(controller: controller)
            }
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "UI Playground"
        return hostingController
    }
}
