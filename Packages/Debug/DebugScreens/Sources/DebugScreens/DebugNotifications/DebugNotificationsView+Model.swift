import Foundation
import SwiftUI
@preconcurrency import UserNotifications

extension DebugNotificationsView {
    struct Model: Sendable {
        var notificationSettings: UNNotificationSettings
        var deleteRegistrationButtonState: ButtonLoadingState = .idle
        var refreshNotificationSettingsButtonState: ButtonLoadingState = .idle
        var requestNotificationsPermissionButtonState: ButtonLoadingState = .idle
        var registerPushTokenButtonState: ButtonLoadingState = .idle

        enum ButtonLoadingState: Equatable, Sendable {
            case idle
            case submitting
        }
    }
}

extension DebugNotificationsView.Model {
    var notificationsSettingsAuthorizationStatusDisplayValue: String {
        switch notificationSettings.authorizationStatus {
        case .notDetermined:
            "Not determined"
            
        case .denied:
            "Denied"
            
        case .authorized:
            "Authorized"
            
        case .provisional:
            "Provisional"
            
        case .ephemeral:
            "Emphemeral"
            
        @unknown default:
            "Unknown"
        }
    }
    
    var notificationsSettingsAuthorizationStatusDisplayColor: Color {
        switch notificationSettings.authorizationStatus {
        case .notDetermined:
            .gray
            
        case .denied:
            .red
            
        case .authorized:
            .green
            
        case .provisional, .ephemeral:
            .yellow
            
        @unknown default:
            .gray
        }
    }
    
    var isRegisterPushTokenButtonDisabled: Bool {
        notificationSettings.shouldPromptForAccess
    }
}
