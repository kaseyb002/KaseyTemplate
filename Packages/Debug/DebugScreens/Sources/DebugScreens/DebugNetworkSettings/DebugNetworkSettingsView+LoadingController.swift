import Combine
import DebugModel
import Foundation
import Colors
import CoreUI

extension DebugNetworkSettingsView {
    final class LoadingController: BaseLoadingController<DebugNetworkSettingsView.Model> {
        private let dataStore: DebugNetworkSettingsViewDataStore
        private let requiredData: DebugNetworkSettingsViewRequiredData
        
        init(
            dataStore: DebugNetworkSettingsViewDataStore,
            requiredData: DebugNetworkSettingsViewRequiredData
        ) {
            self.dataStore = dataStore
            self.requiredData = requiredData
            super.init()
        }
        
        override func load() {
            loadingState = .loading
            
            Task { [weak self] in
                guard let self else { return }
                let model: DebugNetworkSettingsView.Model = .init(
                    debugConfig: Debug.shared.config
                )
                Task { @MainActor [weak self] in
                    self?.loadingState = .loaded(model)
                }
            }
        }
    }
}
