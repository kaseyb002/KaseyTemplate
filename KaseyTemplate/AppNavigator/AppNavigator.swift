import AuthScreens
import Combine
import UIKit
import MediaScreens
import UtilityScreens

@MainActor
final class AppNavigator {
    let deps: AppDeps = .init()
    let rootViewController: UINavigationController = .init()
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - Feature Navigators
    private(set) lazy var authNavigator: AuthScreens.Navigator = makeAuthNavigator()
    private(set) lazy var mediaNavigator: MediaScreens.Navigator = makeMediaNavigator()
    private(set) lazy var utilityNavigator: UtilityScreens.Navigator = makeUtilityNavigator()
    
    // MARK: - Init
    init() {
        setupSubscriptions()
    }
}

// MARK: - Subscriptions
extension AppNavigator {
    private func setupSubscriptions() {
        
    }
}
