import Combine
import UIKit

@MainActor
final class AppNavigator {
    let deps: AppDeps = .init()
    let rootViewController: UINavigationController = .init()
    private var subscriptions: Set<AnyCancellable> = []
}

// MARK: - Subscriptions
extension AppNavigator {
    private func setupSubscriptions() {
        
    }
}
