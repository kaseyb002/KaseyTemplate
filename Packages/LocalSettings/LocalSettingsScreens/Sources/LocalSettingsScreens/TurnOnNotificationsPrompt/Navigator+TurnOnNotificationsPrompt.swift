import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushTurnOnNotificationsPrompt(
        requiredData: TurnOnNotificationsPromptViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: false
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func presentTurnOnNotificationsPrompt(
        requiredData: TurnOnNotificationsPromptViewRequiredData,
        on presentingViewController: UIViewController
    ) {
        let navigationController: UINavigationController = .init()
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController,
            isPresentedModally: true
        )
        navigationController.setViewControllers([viewController], animated: false)
        if let sheet: UISheetPresentationController = navigationController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .none
        }
        presentingViewController.present(navigationController, animated: true)
    }
    
    private func makeViewController(
        requiredData: TurnOnNotificationsPromptViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<TurnOnNotificationsPromptView, TurnOnNotificationsPromptView.Model> = .init(
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
        return hostingController
    }
}
