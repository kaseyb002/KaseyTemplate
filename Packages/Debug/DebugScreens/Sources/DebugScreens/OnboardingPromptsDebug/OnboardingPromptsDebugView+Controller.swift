import Combine
import Foundation
import LocalSettingsModel
import UtilityModel

extension OnboardingPromptsDebugView {
    final class Controller: ObservableObject {
        @Published var model: Model
        private let dataStore: OnboardingPromptsDebugViewDataStore
        private let didSelectNavAction: (NavAction) -> Void
        private var subscriptions: Set<AnyCancellable> = []
        
        init(
            model: Model,
            dataStore: OnboardingPromptsDebugViewDataStore,
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
extension OnboardingPromptsDebugView.Controller {
    func handle(action: OnboardingPromptsDebugView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: OnboardingPromptsDebugView.Action.UI) {
        switch action {
        case .row(let prompt, let action):
            handle(prompt: prompt, action: action)
        }
    }
    
    private func handle(
        prompt keyPath: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        action: OnboardingPromptRowView.Action
    ) {
        var prompt: OnboardingPrompt = model.onboardingPrompts[keyPath: keyPath]
        switch action {
        case .recordPromptTapped:
            prompt.recordPrompt()

        case .resetTapped:
            prompt = .init()

        case .dateChanged(let date):
            prompt.lastPrompted = date
        
        case .decrementCountTapped:
            guard prompt.promptCount > 1 else {
                return
            }
            prompt.promptCount -= 1

        case .incrementCountTapped:
            prompt.promptCount += 1
        }
        model.onboardingPrompts[keyPath: keyPath] = prompt
        save(onboardingPrompt: keyPath, value: prompt)
    }
    
    public func save<T: Equatable>(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, T>,
        value: T
    ) {
        Task { [weak self] in
            guard let self else { return }
            do {
                _ = try await dataStore.save(
                    onboardingPrompt: keyPath,
                    value: value
                )
            } catch {
                Task { @MainActor [weak self] in
                    guard let self else { return }
                    // TODO: restore previous value in model
                    let alert: AlertModel = .errorAlert(error)
                    didSelectNavAction(.alert(alert))
                }
            }
        }
    }
}

// MARK: Subcontrollers
extension OnboardingPromptsDebugView.Controller {
    
}

// MARK: - Subscriptions
extension OnboardingPromptsDebugView.Controller {
    private func setupSubscriptions() {
        
    }
}
