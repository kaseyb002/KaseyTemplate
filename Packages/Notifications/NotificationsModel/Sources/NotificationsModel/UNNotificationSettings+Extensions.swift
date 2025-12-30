import Foundation
@preconcurrency import UserNotifications

extension UNNotificationSettings {
    public static func fake() async -> UNNotificationSettings {
        await UNUserNotificationCenter.current().notificationSettings()
    }
    
    public var shouldPromptForAccess: Bool {
        switch authorizationStatus {
        case .notDetermined, .denied, .ephemeral:
            true
            
        case .authorized, .provisional:
            false
            
        @unknown default:
            true
        }
    }
    
    public var shouldDirectToSystemNotificationSettings: Bool {
        switch authorizationStatus {
        case .denied, .ephemeral:
            true
            
        case .authorized, .provisional, .notDetermined:
            false
            
        @unknown default:
            true
        }
    }
    
    public var isNotificationsEnabled: Bool {
        switch authorizationStatus {
        case .denied, .notDetermined:
            false
            
        case .authorized, .provisional, .ephemeral:
            true
            
        @unknown default:
            false
        }
    }
}
