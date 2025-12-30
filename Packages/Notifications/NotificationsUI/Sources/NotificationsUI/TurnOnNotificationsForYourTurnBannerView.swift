import Colors
import CoreUI
import SwiftUI
@preconcurrency import UserNotifications

public struct TurnOnNotificationsForYourTurnBannerView: View {
    private let authorizationStatus: UNAuthorizationStatus
    private let handleAction: (Action) -> Void

    public enum Action {
        case dismissed
        case systemSettingsTapped
        case enableNotificationsTapped
    }

    public var body: some View {
        switch authorizationStatus {
        case .authorized, .ephemeral, .provisional:
            EmptyView()
            
        case .denied, .notDetermined:
            promptBannerView
            
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
extension TurnOnNotificationsForYourTurnBannerView {
    private var promptBannerView: some View {
        PromptBannerView(
            title: "Get notified when it's your turn",
            detail: "Notifications let you stay in the game even when you leave the app.",
            primaryActionButtonTitle: "Turn on",
            icon: Image(systemName: "bell"),
            tappedDismiss: { handleAction(.dismissed) },
            tappedPrimaryActionButton: {
                if authorizationStatus == .denied {
                    handleAction(.systemSettingsTapped)
                } else {
                    handleAction(.enableNotificationsTapped)
                }
            }
        )
    }
}

#Preview {
    TurnOnNotificationsForYourTurnBannerView(
        authorizationStatus: .denied,
        handleAction: { print($0) }
    )
}
