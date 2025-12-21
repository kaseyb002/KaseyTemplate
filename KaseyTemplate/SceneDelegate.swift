import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appNavigator: AppNavigator = .init()

    // MARK: - Lifecycle
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene: UIWindowScene = scene as? UIWindowScene else {
            return
        }
        let window: UIWindow = .init(windowScene: windowScene)
        appNavigator.presentRootScreen(on: window)
        self.window = window
    }
}
