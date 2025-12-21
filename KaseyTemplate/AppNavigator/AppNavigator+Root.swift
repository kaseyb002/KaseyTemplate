import Colors
import CoreUI
import LaunchApp
import UIKit

extension AppNavigator {
    func presentRootScreen(on window: UIWindow) {
        configureAppUI(window: window)
        presentLaunchScreen()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - Launch Screen
extension AppNavigator {
    private func presentLaunchScreen() {
        LaunchApp.presentLaunchApp(
            dataStore: LaunchAppDataStore(dataStore: deps.dataStore),
            handleNavAction: { [weak self, rootViewController] (action: LaunchApp.NavAction<LaunchAppRequiredData>) in
                self?.handle(
                    launchApp: action,
                    navigationController: rootViewController
                )
            },
            in: rootViewController,
        )
    }
    
    // Workaround to help disambiguate `dataStore` type in `presentLaunchApp()` call
    private struct LaunchAppDataStore: LaunchApp.DataStore {
        private let dataStore: any AppDataStore
        
        init(
            dataStore: any AppDataStore
        ) {
            self.dataStore = dataStore
        }
        
        func setupPreAppLaunch() async throws {
            try await dataStore.setupPreAppLaunch()
        }
        
        func setupPostAppLaunch() async throws {
            try await dataStore.setupPostAppLaunch()
        }
        
        func appRequiredData() async throws -> LaunchAppRequiredData {
            try await dataStore.appRequiredData()
        }
    }
}

// MARK: - Initial Configuration
extension AppNavigator {
    private func configureAppUI(window: UIWindow) {
        HUD.setup(keyWindow: window)
        Toast.setup(keyWindow: window)

        UINavigationBar.appearance().tintColor = .ijInteractive
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.ijLabel]
        UITextField.appearance().tintColor = .ijInteractive
    }
}
