import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushOnboardingPromptsDebug(
        requiredData: OnboardingPromptsDebugViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: OnboardingPromptsDebugViewRequiredData,
        navigationController: UINavigationController
    ) -> UIViewController {
        let loader: OnboardingPromptsDebugView.LoadingController = .init(
            dataStore: deps.dataStore,
            requiredData: requiredData
        )
        let loadingView: LoadingContainerView<OnboardingPromptsDebugView.LoadingController, OnboardingPromptsDebugView> = .init(
            dataLoader: loader,
            content: { [weak navigationController] model in
                let controller: OnboardingPromptsDebugView.Controller = .init(
                    model: model,
                    dataStore: deps.dataStore,
                    didSelectNavAction: { [weak navigationController] action in
                        guard let navigationController else { return }
                        didSelectNavAction(action, navigationController)
                    }
                )
                return OnboardingPromptsDebugView(controller: controller)
            }
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "Onboarding Prompts Debug Menu"
        return hostingController
    }
}
