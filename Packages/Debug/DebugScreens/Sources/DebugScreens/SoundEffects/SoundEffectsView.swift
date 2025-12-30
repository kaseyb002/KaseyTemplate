import SoundEffectPlayer
import Colors
import CoreUI
import SwiftUI

struct SoundEffectsView: View {
    @ObservedObject var controller: Controller
    private var model: Model { controller.model }
    
    var body: some View {
        Form {
            soundEffectRows
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Subviews
extension SoundEffectsView {
    private var soundEffectRows: some View {
        ForEach(SoundEffect.allCases, id: \.rawValue) { effect in
            soundEffectRow(effect: effect)
        }
    }
    
    private func soundEffectRow(effect: SoundEffect) -> some View {
        Button(action: {
            controller.handle(action: .ui(.playSoundTapped(effect)))
        }) {
            Text(effect.displayName)
                .foregroundStyle(Color.ijLabel)
        }
    }
}
