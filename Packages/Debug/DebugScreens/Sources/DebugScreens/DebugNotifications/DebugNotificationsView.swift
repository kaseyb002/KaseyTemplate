import NotificationsModel
import Colors
import CoreUI
import SwiftUI

struct DebugNotificationsView: View {
    @ObservedObject var controller: Controller
    private var model: Model { controller.model }
    
    var body: some View {
        Form {
            Section(footer: authorizationSectionFooterView) {
                authorizationStatus
                requestNotificationsPermissionButton
                registerPushTokenButton
            }
            
            Section {
                refreshNotificationSettingsButton
                deletePushRegistrationButton
            }
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Subviews
extension DebugNotificationsView {
    private var authorizationStatus: some View {
        HStack {
            Text("Authorization Status")
                .foregroundStyle(Color.ijLabel)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(model.notificationsSettingsAuthorizationStatusDisplayValue)
                .foregroundStyle(Color.ijLabel)
                .bold()
            
            Circle()
                .fill(model.notificationsSettingsAuthorizationStatusDisplayColor)
                .frame(width: 12, height: 12)
        }
        .listRowBackground(Color.ijSecondaryBackground)
    }
    
    @ViewBuilder
    private var authorizationSectionFooterView: some View {
        if model.notificationSettings.shouldPromptForAccess {
            Text("Once authorization has been granted, you can register the device's push token.")
        }
    }
    
    private var requestNotificationsPermissionButton: some View {
        ActionButton(
            state: model.requestNotificationsPermissionButtonState,
            action: {
                controller.handle(action: .ui(.requestPermissionTapped))
            },
            label: {
                Text("Request notification permission")
            }
        )
    }

    private var registerPushTokenButton: some View {
        ActionButton(
            state: model.registerPushTokenButtonState,
            action: {
                controller.handle(action: .ui(.registerPushTokenTapped))
            },
            label: {
                Text("Register push token")
            }
        )
        .animation(.default, value: model.isRegisterPushTokenButtonDisabled)
        .disabled(model.isRegisterPushTokenButtonDisabled)
        .opacity(model.isRegisterPushTokenButtonDisabled ? 0.5 : 1.0)
    }
    
    private var refreshNotificationSettingsButton: some View {
        ActionButton(
            state: model.refreshNotificationSettingsButtonState,
            action: {
                controller.handle(action: .ui(.refreshNotificationSettingsTapped))
            },
            label: {
                Text("Refresh notification settings")
            }
        )
    }
    
    private var deletePushRegistrationButton: some View {
        ActionButton(
            role: .destructive,
            state: model.deleteRegistrationButtonState,
            action: {
                controller.handle(action: .ui(.deletePushRegistrationTapped))
            },
            label: {
                Text("Delete push registration")
            }
        )
    }
    
    private struct ActionButton<ButtonLabel: View>: View {
        var role: ButtonRole = .cancel
        let state: DebugNotificationsView.Model.ButtonLoadingState
        let action: () -> Void
        let label: () -> ButtonLabel
        
        var body: some View {
            HStack(spacing: 4) {
                if state == .submitting {
                    LoadingSpinnerView()
                }
                
                Button(
                    role: role,
                    action: action
                ) {
                    label()
                }
            }
            .animation(.default, value: state)
            .disabled(state == .submitting)
            .opacity(state == .submitting ? 0.5 : 1.0)
            .listRowBackground(Color.ijSecondaryBackground)
        }
    }
}
