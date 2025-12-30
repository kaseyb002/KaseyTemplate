import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushSignInToContinue(
        requiredData: SignInToContinueViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        navigationController.pushViewController(viewController, animated: true)
    }

    public func presentSignInToContinue(
        requiredData: SignInToContinueViewRequiredData,
        on presentingViewController: UIViewController
    ) {
        let navigationController: UINavigationController = .init()
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: true
        )
        navigationController.setViewControllers([viewController], animated: false)
        navigationController.sheetPresentationController?.detents = [
            .medium(),
        ]
        presentingViewController.present(navigationController, animated: true)
    }
    
    private func makeViewController(
        requiredData: SignInToContinueViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<SignInToContinueView, SignInToContinueView.Model> = .init(
            requiredData: requiredData,
            deps: .init(
                dataStore: deps.dataStore,
                appleSignInController: AppleSignInController(),
                didSelectNavAction: { [weak navigationController] action in
                    guard let navigationController: UINavigationController else { return }
                    didSelectNavAction(action, navigationController)
                },
            ),
            dataStore: deps.dataStore,
            isPresentedModally: isPresentedModally,
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        return hostingController
    }
}
