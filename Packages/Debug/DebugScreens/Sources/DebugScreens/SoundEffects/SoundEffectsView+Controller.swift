import Combine
import Foundation
import SoundEffectPlayer

extension SoundEffectsView {
    final class Controller: ObservableObject {
        @Published var model: Model
        private let soundEffectPlayer: SoundEffectPlayer
        private let dataStore: SoundEffectsViewDataStore
        private let didSelectNavAction: (NavAction) -> Void
        private var subscriptions: Set<AnyCancellable> = []
        
        init(
            model: Model,
            dataStore: SoundEffectsViewDataStore,
            soundEffectPlayer: SoundEffectPlayer,
            didSelectNavAction: @escaping (NavAction) -> Void
        ) {
            self.model = model
            self.dataStore = dataStore
            self.soundEffectPlayer = soundEffectPlayer
            self.didSelectNavAction = didSelectNavAction
            
            handle(action: .initiated)
        }
    }
}

// MARK: - Actions
extension SoundEffectsView.Controller {
    func handle(action: SoundEffectsView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: SoundEffectsView.Action.UI) {
        switch action {
        case .playSoundTapped(let effect):
            soundEffectPlayer.playSound(effect: effect)
        }
    }
}

// MARK: Subcontrollers
extension SoundEffectsView.Controller {
    
}

// MARK: - Subscriptions
extension SoundEffectsView.Controller {
    private func setupSubscriptions() {
        
    }
}
