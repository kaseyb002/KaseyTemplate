import CoreUI
import SwiftUI

extension Navigator {
    public func pushEmailSignIn(
        requiredData: EmailSignInViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: EmailSignInViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<EmailSignInView, EmailSignInView.Model> = .init(
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
        hostingController.title = "Email Sign In"
        return hostingController
    }
}
