import Combine
import Foundation
import Colors
import CoreUI
@preconcurrency import UserNotifications

extension DebugNotificationsView {
    final class LoadingController: BaseLoadingController<DebugNotificationsView.Model> {
        private let dataStore: DebugNotificationsViewDataStore
        private let requiredData: DebugNotificationsViewRequiredData
        
        init(
            dataStore: DebugNotificationsViewDataStore,
            requiredData: DebugNotificationsViewRequiredData
        ) {
            self.dataStore = dataStore
            self.requiredData = requiredData
            super.init()
        }
        
        override func load() {
            loadingState = .loading
            
            Task { [weak self] in
                guard let self else { return }
                do {
                    let settings: UNNotificationSettings = try await dataStore.notificationSettings()
                    let model: DebugNotificationsView.Model = .init(
                        notificationSettings: settings
                    )
                    Task { @MainActor [weak self] in
                        self?.loadingState = .loaded(model)
                    }
                } catch {
                    Task { @MainActor [weak self] in
                        self?.loadingState = .error(error)
                    }
                }
            }
        }
    }
}
