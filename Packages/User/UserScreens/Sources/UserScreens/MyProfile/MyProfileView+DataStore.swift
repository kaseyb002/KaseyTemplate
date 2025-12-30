import Combine
import DebugModel
import Foundation
import LocalSettingsModel
import UIKit
import UserModel
@preconcurrency import UserNotifications

public protocol MyProfileViewDataStore: Actor, Sendable {
    func signOut() async throws
    
    func deleteAccount() async throws
    
    func myUser() async throws -> User
    
    func update(
        profileImage: UIImage,
    ) async throws -> User
    
    var didSignOut: AnyPublisher<Void, Never> { get }
    var userDidRefresh: AnyPublisher<User, Never> { get }
    
    func save<T>(
        setting keyPath: WritableKeyPath<LocalSettings, T>,
        value: T
    ) async throws where T : Equatable & Sendable
    
    func settingValue<T>(
        _ keyPath: KeyPath<LocalSettings, T>,
    ) async throws -> T where T: Sendable
    
    func notificationSettings() async throws -> UNNotificationSettings

    func debugConfig() async throws -> DebugConfig
    
    func saveDebugConfig<V>(
        _ keyPath: WritableKeyPath<DebugConfig, V>,
        value: V,
    ) async throws

    func requestNotificationPermission() async throws

    var didUpdateNotificationsAuthorizationStatus: AnyPublisher<UNNotificationSettings, Never> { get }
}
