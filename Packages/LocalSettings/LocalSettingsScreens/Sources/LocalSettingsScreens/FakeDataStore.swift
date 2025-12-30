import Combine
import Foundation
import LocalSettingsModel
import NotificationsModel
import UIKit
import UserModel

public final actor FakeDataStore: DataStore {
    public func save(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        hasPrompted: Bool
    ) async throws {
        
    }
    
    public func notificationSettings() async throws -> UNNotificationSettings {
        await .fake()
    }
    
    public func myUser() async throws -> User {
        .fake()
    }
    
    public func requestNotificationPermission() async throws {
        
    }
}
