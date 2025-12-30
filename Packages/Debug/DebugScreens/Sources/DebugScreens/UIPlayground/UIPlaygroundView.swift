import Colors
import CoreUI
import SwiftUI

struct UIPlaygroundView: View {
    @ObservedObject var controller: Controller
    private var model: Model { controller.model }
    
    var body: some View {
        Form {
            Section {
                noLimitHoldEmUIPlaygroundButton
                noLimitHoldEmPlaceBetButton
            }
            
            Section {
                stage10UIPlaygroundButton
                stage10LayDownButton
                stage10ChooseSkipButton
            }
            
            Section {
                wordsSelectLetterButton
                wordsSelectTileButton
                wordsSelectManyTilesButton
            }
            
            Section {
                soundEffectsButton
            }
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Subviews
extension UIPlaygroundView {
    private var noLimitHoldEmUIPlaygroundButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "dollarsign"),
            iconColor: .green,
            title: "No-Limit Hold’em UI",
            didTap: {
                controller.handle(action: .ui(.noLimitHoldEmUIPlaygroundTapped))
            }
        )
    }
    
    private var noLimitHoldEmPlaceBetButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "dollarsign"),
            iconColor: .green,
            title: "Place bet",
            didTap: {
                controller.handle(action: .ui(.noLimitHoldEmPlaceBetTapped))
            }
        )
    }
    
    private var stage10UIPlaygroundButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "10.circle"),
            iconColor: .yellow,
            title: "Stage 10 UI",
            didTap: {
                controller.handle(action: .ui(.stage10UIPlaygroundTapped))
            }
        )
    }
    
    private var stage10LayDownButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "10.circle"),
            iconColor: .purple,
            title: "Stage 10 Lay Down",
            didTap: {
                controller.handle(action: .ui(.stage10LayDownTapped))
            }
        )
    }
    
    private var stage10ChooseSkipButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "10.circle"),
            iconColor: .purple,
            title: "Stage 10 Choose Skip",
            didTap: {
                controller.handle(action: .ui(.stage10ChooseSkipTapped))
            }
        )
    }
    
    private var wordsSelectLetterButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "a.square"),
            iconColor: .orange,
            title: "Words Select Letter",
            didTap: {
                controller.handle(action: .ui(.wordsSelectLetterTapped))
            }
        )
    }
    
    private var wordsSelectTileButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "character.textbox"),
            iconColor: .orange,
            title: "Words Select Tile",
            didTap: {
                controller.handle(action: .ui(.wordsSelectTileTapped))
            }
        )
    }
    
    private var wordsSelectManyTilesButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "textformat.abc"),
            iconColor: .orange,
            title: "Words Select Many Tiles",
            didTap: {
                controller.handle(action: .ui(.wordsSelectManyTilesTapped))
            }
        )
    }
    
    private var soundEffectsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "speaker.wave.2"),
            iconColor: .cyan,
            title: "Sound Effects",
            didTap: {
                controller.handle(action: .ui(.soundEffectsTapped))
            }
        )
    }
}
