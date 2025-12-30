import Colors
import CoreUI
import SwiftUI
@preconcurrency import UserNotifications

public struct NotificationsStatusBannerView: View {
    private let authorizationStatus: UNAuthorizationStatus
    private let handleAction: (Action) -> Void

    public enum Action {
        case systemSettingsTapped
        case enableNotificationsTapped
    }
    
    public var body: some View {
        switch authorizationStatus {
        case .authorized, .ephemeral, .provisional:
            EmptyView()
            
        case .denied:
            deniedView
            
        case .notDetermined:
            notYetPromptedView
    
        @unknown default:
            EmptyView()
        }
    }
    
    public init(
        authorizationStatus: UNAuthorizationStatus,
        handleAction: @escaping (Action) -> Void
    ) {
        self.authorizationStatus = authorizationStatus
        self.handleAction = handleAction
    }
}

// MARK: - Subviews
extension NotificationsStatusBannerView {
    private var notYetPromptedView: some View {
        Button(action: {
            handleAction(.enableNotificationsTapped)
        }) {
            HStack(alignment: .top) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(Color.red)
                    .offset(y: 3)

                (Text("Notifications are off.\n")
                    .foregroundStyle(Color.ijLabel)
                 +
                 Text("Turn them on.")
                    .foregroundStyle(Color.ijInteractive))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    private var deniedView: some View {
        Button(action: {
            handleAction(.systemSettingsTapped)
        }) {
            HStack(alignment: .top) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.title)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.white, Color.red)
                    .offset(y: 3)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Your-turn notifications are off.")
                        .foregroundStyle(Color.ijLabel)
                    Text("Turn them on in Settings.")
                        .foregroundStyle(Color.ijInteractive)
                }
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
