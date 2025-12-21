import CoreUI
import SwiftUI

extension Navigator {
    public func presentGIFDetail(
        requiredData: GIFDetailViewRequiredData,
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
        requiredData: GIFDetailViewRequiredData,
        navigationController: UINavigationController,
        isPresentedModally: Bool
    ) -> UIViewController {
        let loadingView: LoadingView<GIFDetailView, GIFDetailView.Model> = .init(
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
