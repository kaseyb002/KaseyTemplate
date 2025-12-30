import Combine
import Foundation
import Colors
import CoreUI

extension UIPlaygroundView {
    final class LoadingController: BaseLoadingController<UIPlaygroundView.Model> {
        private let dataStore: UIPlaygroundViewDataStore
        private let requiredData: UIPlaygroundViewRequiredData
        
        init(
            dataStore: UIPlaygroundViewDataStore,
            requiredData: UIPlaygroundViewRequiredData
        ) {
            self.dataStore = dataStore
            self.requiredData = requiredData
            super.init()
        }
        
        override func load() {
            loadingState = .loading
            
            Task { [weak self] in
                guard let self else { return }
                let model: UIPlaygroundView.Model = .init()
                Task { @MainActor [weak self] in
                    self?.loadingState = .loaded(model)
                }
            }
        }
    }
}
