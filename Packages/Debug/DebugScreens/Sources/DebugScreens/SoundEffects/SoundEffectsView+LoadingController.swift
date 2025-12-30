import Combine
import Foundation
import Colors
import CoreUI

extension SoundEffectsView {
    final class LoadingController: BaseLoadingController<SoundEffectsView.Model> {
        private let dataStore: SoundEffectsViewDataStore
        private let requiredData: SoundEffectsViewRequiredData
        
        init(
            dataStore: SoundEffectsViewDataStore,
            requiredData: SoundEffectsViewRequiredData
        ) {
            self.dataStore = dataStore
            self.requiredData = requiredData
            super.init()
        }
        
        override func load() {
            loadingState = .loading
            
            Task { [weak self] in
                guard let self else { return }
                let model: SoundEffectsView.Model = .init()
                Task { @MainActor [weak self] in
                    self?.loadingState = .loaded(model)
                }
            }
        }
    }
}
