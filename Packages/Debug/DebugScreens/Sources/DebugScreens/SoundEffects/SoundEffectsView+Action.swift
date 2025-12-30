import Foundation
import SoundEffectPlayer

extension SoundEffectsView {
    enum Action {
        case initiated
        case ui(UI)

        enum UI {
            case playSoundTapped(SoundEffect)
        }
    }
}
