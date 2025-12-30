import Foundation

extension UIPlaygroundView {
    enum Action {
        case initiated
        case ui(UI)

        enum UI {
            case noLimitHoldEmUIPlaygroundTapped
            case noLimitHoldEmPlaceBetTapped
            case stage10UIPlaygroundTapped
            case stage10LayDownTapped
            case stage10ChooseSkipTapped
            case soundEffectsTapped
            case wordsSelectManyTilesTapped
            case wordsSelectTileTapped
            case wordsSelectLetterTapped
        }
    }
}
