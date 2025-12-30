import Combine
import Foundation
import Colors
import CoreUI
import LocalSettingsModel

extension OnboardingPromptsDebugView {
    final class LoadingController: BaseLoadingController<OnboardingPromptsDebugView.Model> {
        private let dataStore: OnboardingPromptsDebugViewDataStore
        private let requiredData: OnboardingPromptsDebugViewRequiredData
        
        init(
            dataStore: OnboardingPromptsDebugViewDataStore,
            requiredData: OnboardingPromptsDebugViewRequiredData
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
                    let prompts: OnboardingPrompts = try await dataStore.onboardingPrompts()
                    let model: OnboardingPromptsDebugView.Model = .init(
                        onboardingPrompts: prompts
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
