import Combine
import DebugModel
import Foundation
import LocalSettingsModel
import NotificationsModel
import UIKit
import UserModel
@preconcurrency import UserNotifications

public final actor FakeDataStore: @preconcurrency DataStore {
    private nonisolated(unsafe) let didUpdateNotificationsAuthorizationStatusSubject: PassthroughSubject<UNNotificationSettings, Never> = .init()
    private nonisolated(unsafe) let userDidRefreshSubject: PassthroughSubject<UserModel.User, Never> = .init()
    private nonisolated(unsafe) let didSignOutSubject: PassthroughSubject<Void, Never> = .init()
    
    public var didUpdateNotificationsAuthorizationStatus: AnyPublisher<UNNotificationSettings, Never> {
        didUpdateNotificationsAuthorizationStatusSubject.eraseToAnyPublisher()
    }
    
    public var userDidRefresh: AnyPublisher<User, Never> {
        userDidRefreshSubject.eraseToAnyPublisher()
    }
    
    public var didSignOut: AnyPublisher<Void, Never> {
        didSignOutSubject.eraseToAnyPublisher()
    }

    public func debugConfig() async throws -> DebugModel.DebugConfig {
        .init()
    }
    
    public func saveDebugConfig<V>(
        _ keyPath: WritableKeyPath<DebugModel.DebugConfig, V>,
        value: V
    ) async throws {
        
    }
    
    public func notificationSettings() async throws -> UNNotificationSettings {
        await .fake()
    }
    
    public func requestNotificationPermission() async throws {
        
    }
    
    
    public func save<T>(
        setting keyPath: WritableKeyPath<LocalSettingsModel.LocalSettings, T>,
        value: T
    ) async throws where T : Equatable & Sendable {
        
    }
    
    public func settingValue<T>(
        _ keyPath: KeyPath<LocalSettingsModel.LocalSettings, T>
    ) async throws -> T {
        LocalSettings.fake()[keyPath: keyPath]
    }
    
    
    public func update(profileImage: UIImage) async throws -> User {
        .fake()
    }
    
    public func update(username: String) async throws -> User {
        .fake()
    }
    
    public func signOut() async throws {
        
    }
    
    public func deleteAccount() async throws {
        
    }
    
    public func validate(username: String) async throws -> ValidUsernameStatus {
        .valid
    }
    
    
    public func myUser() async throws -> User {
        .fake()
    }
}
