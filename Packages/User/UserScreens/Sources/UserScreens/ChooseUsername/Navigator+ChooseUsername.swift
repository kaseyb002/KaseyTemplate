import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushChooseUsername(
        requiredData: ChooseUsernameViewRequiredData,
        onto navigationController: UINavigationController,
        hidesBackButton: Bool = false
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        viewController.navigationItem.hidesBackButton = true
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: ChooseUsernameViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<ChooseUsernameView, ChooseUsernameView.Model> = .init(
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
        hostingController.title = "Choose username"
        return hostingController
    }
}
