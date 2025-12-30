import Combine
import Foundation
import LocalSettingsModel
import UserModel
@preconcurrency import UserNotifications

public protocol TurnOnNotificationsPromptViewDataStore: Actor, Sendable {
    func myUser() async throws -> User
    
    func requestNotificationPermission() async throws
    
    func notificationSettings() async throws -> UNNotificationSettings

    func save(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        hasPrompted: Bool
    ) async throws
}
