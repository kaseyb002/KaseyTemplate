import SwiftUI

final class DebugWindow: UIWindow {
    private static var currentWindow: UIWindow?
    
    @objc static func present(completion: @escaping () -> Void = {}) {
        let debugViewController = UIHostingController(rootView: Text("hey"))
        let navigationController = DebugNavigationController(rootViewController: debugViewController)
        let window = DebugWindow()
        window.backgroundColor = nil
        window.rootViewController = navigationController
        window.windowLevel = UIWindow.Level.normal + 1
        window.makeKeyAndVisible()
    }
}

final class DebugNavigationController: UINavigationController {}
