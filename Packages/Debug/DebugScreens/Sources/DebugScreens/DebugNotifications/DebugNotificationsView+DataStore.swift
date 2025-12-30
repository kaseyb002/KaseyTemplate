import Combine
import Foundation
@preconcurrency import UserNotifications

public protocol DebugNotificationsViewDataStore {
    func notificationSettings() async throws -> UNNotificationSettings
    
    func requestNotificationPermission() async throws
    
    func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws

    func deletePushRegistration() async throws
}
