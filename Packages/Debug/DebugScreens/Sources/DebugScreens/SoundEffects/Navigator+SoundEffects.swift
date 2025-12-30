import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func pushSoundEffects(
        requiredData: SoundEffectsViewRequiredData,
        onto navigationController: UINavigationController
    ) {
        let viewController: UIViewController = makeViewController(
            requiredData: requiredData,
            navigationController: navigationController
        )
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func makeViewController(
        requiredData: SoundEffectsViewRequiredData,
        navigationController: UINavigationController
    ) -> UIViewController {
        let loader: SoundEffectsView.LoadingController = .init(
            dataStore: deps.dataStore,
            requiredData: requiredData
        )
        let loadingView: LoadingContainerView<SoundEffectsView.LoadingController, SoundEffectsView> = .init(
            dataLoader: loader,
            content: { [weak navigationController] model in
                let controller: SoundEffectsView.Controller = .init(
                    model: model,
                    dataStore: deps.dataStore,
                    soundEffectPlayer: deps.soundEffectPlayer,
                    didSelectNavAction: { [weak navigationController] action in
                        guard let navigationController else { return }
                        didSelectNavAction(action, navigationController)
                    }
                )
                return SoundEffectsView(controller: controller)
            }
        )
        let hostingController: HostingController = .init(
            rootView: loadingView
        )
        hostingController.title = "Sound Effects"
        return hostingController
    }
}
