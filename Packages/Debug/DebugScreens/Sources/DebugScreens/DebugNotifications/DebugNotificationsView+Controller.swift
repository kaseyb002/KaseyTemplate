import Combine
import Foundation
import Colors
import CoreUI
@preconcurrency import UserNotifications
import UtilityModel

extension DebugNotificationsView {
    final class Controller: ObservableObject {
        @Published var model: Model
        private let dataStore: DebugNotificationsViewDataStore
        private let didSelectNavAction: (NavAction) -> Void
        private var subscriptions: Set<AnyCancellable> = []
        
        init(
            model: Model,
            dataStore: DebugNotificationsViewDataStore,
            didSelectNavAction: @escaping (NavAction) -> Void
        ) {
            self.model = model
            self.dataStore = dataStore
            self.didSelectNavAction = didSelectNavAction
            
            handle(action: .initiated)
        }
    }
}

// MARK: - Actions
extension DebugNotificationsView.Controller {
    func handle(action: DebugNotificationsView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: DebugNotificationsView.Action.UI) {
        switch action {
        case .deletePushRegistrationTapped:
            model.deleteRegistrationButtonState = .submitting
            Task { [weak self] in
                guard let self else { return }
                do {
                    try await dataStore.deletePushRegistration()
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        showToast("Registration deleted")
                        model.deleteRegistrationButtonState = .idle
                    }
                } catch {
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        let alert: AlertModel = .errorAlert(error)
                        didSelectNavAction(.alert(alert))
                        model.deleteRegistrationButtonState = .idle
                    }
                }
            }
            
        case .refreshNotificationSettingsTapped:
            model.refreshNotificationSettingsButtonState = .submitting
            Task { [weak self] in
                guard let self else { return }
                do {
                    let settings: UNNotificationSettings = try await dataStore.notificationSettings()
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        model.notificationSettings = settings
                        model.refreshNotificationSettingsButtonState = .idle
                        showToast("Setting refreshed")
                    }
                } catch {
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        let alert: AlertModel = .errorAlert(error)
                        didSelectNavAction(.alert(alert))
                        model.refreshNotificationSettingsButtonState = .idle
                    }
                }
            }
            
        case .requestPermissionTapped:
            model.requestNotificationsPermissionButtonState = .submitting
            Task { [weak self] in
                guard let self else { return }
                do {
                    try await dataStore.requestNotificationPermission()
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        showToast("Permission requested")
                        model.requestNotificationsPermissionButtonState = .idle
                    }
                } catch {
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        let alert: AlertModel = .errorAlert(error)
                        didSelectNavAction(.alert(alert))
                        model.requestNotificationsPermissionButtonState = .idle
                    }
                }
            }
            
        case .registerPushTokenTapped:
            model.registerPushTokenButtonState = .submitting
            Task { [weak self] in
                guard let self else { return }
                do {
                    try await dataStore.registerForRemoteNotificationsIfAuthorizationHasBeenGranted()
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        showToast("Push token registration requested")
                        model.registerPushTokenButtonState = .idle
                    }
                } catch {
                    Task { @MainActor [weak self] in
                        guard let self else { return }
                        let alert: AlertModel = .errorAlert(error)
                        didSelectNavAction(.alert(alert))
                        model.registerPushTokenButtonState = .idle
                    }
                }
            }
        }
    }
}

// MARK: Subcontrollers
extension DebugNotificationsView.Controller {
    
}

// MARK: - Subscriptions
extension DebugNotificationsView.Controller {
    private func setupSubscriptions() {
        
    }
}
