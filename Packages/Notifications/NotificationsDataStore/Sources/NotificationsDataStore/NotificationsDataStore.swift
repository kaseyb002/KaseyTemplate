import Combine
import Foundation
import GroupModel
import FirebaseCore
import FirebaseMessaging
import Logger
import NotificationsClient
import NotificationsModel
@preconcurrency import UserNotifications

public protocol NotificationsDataStore: NSObject {
    func setup() async throws
    
    func notificationSettings() async throws -> UNNotificationSettings
    
    func requestNotificationPermission() async throws
    
    func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws
    
    func setDevice(token: Data)
    
    func registerNotificationCategories()
    
    func groupNotificationSettings(
        groupID: GroupID
    ) async throws -> GroupNotificationSettings
    
    func editGroupNotificationSettings(
        form: EditGroupNotificationSettingsForm
    ) async throws -> GroupNotificationSettings
    
    func deletePushRegistration() async throws
}
