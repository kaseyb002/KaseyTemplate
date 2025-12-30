import Combine
import DebugModel
import Foundation

extension DebugNetworkSettingsView {
    final class Controller: ObservableObject {
        @Published var model: Model
        private let dataStore: DebugNetworkSettingsViewDataStore
        private let didSelectNavAction: (NavAction) -> Void
        private var subscriptions: Set<AnyCancellable> = []
        
        init(
            model: Model,
            dataStore: DebugNetworkSettingsViewDataStore,
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
extension DebugNetworkSettingsView.Controller {
    func handle(action: DebugNetworkSettingsView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: DebugNetworkSettingsView.Action.UI) {
        switch action {
        case .serverEnvironmentSelected(let serverEnvironment):
            Task { [weak self] in
                guard let self else { return }
                try? await dataStore.signOut()
                Task { @MainActor [weak self] in
                    guard let self else { return }
                    mutateConfig { $0.serverEnvironment = serverEnvironment }
                }
            }

        case .showSocketConnectionStatusToggled(let isOn):
            mutateConfig { $0.isShowingSocketConnectionIndicators = isOn }
        }
    }
    
    private func mutateConfig(_ mutate: (inout DebugConfig) -> Void) {
        var debugConfig: DebugConfig = model.debugConfig
        mutate(&debugConfig)
        model.debugConfig = debugConfig
        Debug.shared.config = debugConfig
    }
}

// MARK: Subcontrollers
extension DebugNetworkSettingsView.Controller {
    
}

// MARK: - Subscriptions
extension DebugNetworkSettingsView.Controller {
    private func setupSubscriptions() {
        
    }
}
