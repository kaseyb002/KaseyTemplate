import Combine
import Foundation
import GameModel
import NotificationsModel
import LocalSettingsModel
import SocketClient
import Stage10Model
import Stage10GameModel
import GroupModel
import UIKit
import UserModel

public final class FakeDataStore: DataStore {
    public func cachedGroupDetailsFirstPage() async -> GameModel.GroupDetailPage? {
        .fake()
    }
    
    public func groupDetails(
        pageIndex: Int?
    ) async throws -> GroupDetailPage {
        .fake()
    }
    
    public func groupInvites(
        groupID: GroupID,
        pageIndex: Int?
    ) async throws -> GroupInvitesPage {
        .fake()
    }
    
    public var didUpdateStage10GamePlayer: PassthroughSubject<Stage10GameModel.GamePlayer, Never> = .init()
    public var didUpdateStage10GameRound: PassthroughSubject<Stage10GameModel.Round, Never> = .init()
    public var didUpdateStage10Game: PassthroughSubject<Stage10GameModel.Game, Never> = .init()
    
    public func connectToStage10Game(
        id: Stage10GameModel.GameID
    ) async throws -> any UISocketConnection {
        FakeUISocketConnection()
    }
    
    public func stage10CompleteStage(
        gameID: Stage10GameModel.GameID,
        form: Stage10Model.CompleteStageForm
    ) async throws -> Stage10GameModel.Round {
        try .fake()
    }

    public func stage10PickUpCard(
        gameID: Stage10GameModel.GameID,
        fromDiscardPile: Bool
    ) async throws -> Stage10GameModel.Round {
        try .fake()
    }
    
    public func stage10Discard(
        gameID: Stage10GameModel.GameID,
        cardID: Stage10Model.CardID
    ) async throws -> Stage10GameModel.Round {
        try .fake()
    }
    
    public func stage10CurrentRound(
        gameID: GameID
    ) async throws -> Stage10GameModel.Round? {
        try .fake()
    }

    public func stage10StartRound(
        gameID: Stage10GameModel.GameID
    ) async throws -> Stage10GameModel.Round {
        try .fake()
    }
    
    public func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws {
        
    }
    
    public func notificationSettings() async throws -> UNNotificationSettings {
        await .fake()
    }
    
    public func requestNotificationPermission() async throws {
        
    }
    
    public func deletePushRegistration() async throws {
        
    }
    
    public func signOut() async throws {
        
    }

    public func stage10Game(
        id: Stage10GameModel.GameID
    ) async throws -> Stage10GameModel.Game {
        .fake()
    }
    
    public func myGroupMember(
        groupID: GroupModel.GroupID
    ) async throws -> GroupModel.GroupMember {
        .fake()
    }
    
    public func stage10GamePlayer(
        playerID: Stage10GameModel.GamePlayerID
    ) async throws -> Stage10GameModel.GamePlayer {
        .fake()
    }
    
    public func sittingPlayers(
        gameID: Stage10GameModel.GameID
    ) async throws -> [Stage10GameModel.GamePlayer] {
        [
            .fake(),
            .fake(),
            .fake(),
            .fake(),
        ]
    }
    
    public func stage10SitDown(
        gameID: Stage10GameModel.GameID
    ) async throws -> Stage10GameModel.GamePlayer {
        .fake()
    }
    
    public func stage10SitOut(
        gameID: Stage10GameModel.GameID
    ) async throws -> Stage10GameModel.GamePlayer {
        .fake()
    }
    
    public func sitStage10PlayerOut(
        playerID: Stage10GameModel.GamePlayerID
    ) async throws -> Stage10GameModel.GamePlayer {
        .fake()
    }
    
    public func stage10AddCard(
        gameID: GameID,
        form: AddCardForm
    ) async throws -> Stage10GameModel.Round {
        try .fake()
    }
    
    public func onboardingPrompts() async throws -> OnboardingPrompts {
        .fake()
    }
    
    public func save<T>(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, T>,
        value: T
    ) async throws where T : Equatable & Sendable {
        
    }
   
    public init() {
        
    }
}
