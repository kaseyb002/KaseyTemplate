import Colors
import CoreUI
import SwiftUI

struct DebugMenuView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Form {
            Section {
                uiPlaygroundButton
                onboardingPromptsButton
                currrentGamesButton
                groupPreviewButton
            }
            
            Section {
                networkingSettingsButton
                notificationsButton
                urlHandlerButton
            }
            
            Section {
                updateAppButton
                rateAppsButton
            }
            
            Section {
                signOutButton
            }
        }
        .scrollContentBackground(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButton
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension DebugMenuView {
    private var uiPlaygroundButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "skateboard.fill"),
            iconColor: .cyan,
            title: "UI Playground",
            didTap: {
                controller.handle(action: .ui(.uiPlaygroundTapped))
            }
        )
    }
    
    private var onboardingPromptsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "graduationcap.fill"),
            iconColor: .purple,
            title: "Onboarding Prompts",
            didTap: {
                controller.handle(action: .ui(.onboardingPromptsTapped))
            }
        )
    }

    private var currrentGamesButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "rectangle.split.3x1"),
            iconColor: .green,
            title: "Current Games",
            didTap: {
                controller.handle(action: .ui(.currentGamesTapped))
            }
        )
    }
    
    private var groupPreviewButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "eye"),
            iconColor: .green,
            title: "Group Preview",
            didTap: {
                controller.handle(action: .ui(.tablePreviewTapped))
            }
        )
    }
    
    private var networkingSettingsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "network"),
            iconColor: .blue,
            title: "Network Settings",
            didTap: {
                controller.handle(action: .ui(.networkSettingsTapped))
            }
        )
    }
    
    private var notificationsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "bell"),
            iconColor: .red,
            title: "Notifications",
            didTap: {
                controller.handle(action: .ui(.notificationsTapped))
            }
        )
    }
    
    private var urlHandlerButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "link"),
            iconColor: .blue,
            title: "URL and Push Action Navigation",
            didTap: {
                controller.handle(action: .ui(.urlHandlerTapped))
            }
        )
    }
    
    private var updateAppButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "icloud.and.arrow.down"),
            iconColor: .blue,
            title: "Update app",
            didTap: {
                controller.handle(action: .ui(.updateAppTapped))
            }
        )
    }
    
    private var rateAppsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "star.fill"),
            iconColor: .orange,
            title: "Rate apps",
            didTap: {
                controller.handle(action: .ui(.rateAppsTapped))
            }
        )
    }
    
    private var signOutButton: some View {
        Button(
            role: .destructive,
            action: {
                controller.handle(action: .ui(.signOutTapped))
            }) {
                Text("Sign out")
            }
            .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var closeButton: some View {
        CloseButton(didTap: {
            controller.handle(action: .ui(.closeTapped))
        })
    }
}
