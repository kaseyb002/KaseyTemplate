import Foundation
import NotificationsModel
import Colors
import CoreUI
import Stage10Model
import UtilityModel
import WordsModel

public enum NavAction {
    case alert(AlertModel)
    case currentGames
    case debugNotifications
    case debugURLHandler(
        pushCount: Int,
        modalCount: Int,
        presentModal: Bool
    )
    case dismiss(completion: (() -> Void)? = nil)
    case imageDetail(imageSource: ImageSource)
    case networkSettings
    case noLimitHoldEmUIPlayground
    case onboardingPromptsDebug
    case placeBet(
        min: Decimal,
        max: Decimal,
        increment: Decimal,
        didPlaceBet: @MainActor @Sendable (Decimal) -> Void
    )
    case pop
    case stage10UIPlayground
    case stage10Laydown(
        stage: Stage,
        cards: [Stage10Model.Card],
        setWildAs: @MainActor @Sendable (Card, WildCard.UsedAs) async throws -> Card,
        didCompleteForm: @MainActor @Sendable (CompleteStageForm) -> Void
    )
    case stage10ChooseSkip(
        myUserID: String?,
        playerHands: [PlayerHand],
        skips: Dictionary<String, Int>,
        didSelectPlayer: @MainActor @Sendable (PlayerHand) -> Void
    )
    case soundEffects
    case urlTestHandler(url: URL)
    case pushActionTestHandler(PushNotificationAppAction)
    case uiPlayground
    case debugRateApps
    case updateApp
    case rateApp(OtherApp)
    case groupPreview
    case wordsSelectManyTiles(
        tiles: [Tile],
        didSelect: @MainActor @Sendable (Set<Tile>) -> Void
    )
    case wordsSelectTile(
        tiles: [Tile],
        didSelect: @MainActor @Sendable (Tile) -> Void
    )
    case wordsSelectLetter(
        didSelect: @MainActor @Sendable (Tile.Letter) -> Void
    )
}
