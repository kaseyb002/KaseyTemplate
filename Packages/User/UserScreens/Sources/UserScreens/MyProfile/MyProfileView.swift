import Colors
import CoreUI
import NotificationsUI
import PhotosUI
import SwiftUI

struct MyProfileView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Form {
            Section {
                profileInfoView
                photoPicker
                usernameButton
            }
            
            Section {
                notificationsStatusBanner
            }

            Section {
                rateAppButton
                feedbackButton
            }
            
            Section {
                signOutButton
                deleteAccountButton
            }
            
            Section {
                emailLabel
            }
            
            Section {
                debugMenuButton
            }
        }
        .scrollContentBackground(.hidden)
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension MyProfileView {
    private var usernameButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "person.text.rectangle"),
            iconColor: .blue,
            title: "Change username",
            didTap: {
                handle(action: .ui(.changeUsernameTapped))
            }
        )
    }
    
    private var rateAppButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "star.fill"),
            iconColor: .orange,
            title: "Rate the app",
            didTap: {
                handle(action: .ui(.rateAppTapped))
            }
        )
    }
    
    private var feedbackButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "lightbulb.fill"),
            iconColor: .purple,
            title: "Send feedback",
            didTap: {
                handle(action: .ui(.sendFeedbackTapped))
            }
        )
    }
    
    private var otherAppsButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "person"),
            iconColor: .brown,
            title: "Single player apps",
            didTap: {
                handle(action: .ui(.otherApps))
            }
        )
    }
    
    private var learnPokerButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "graduationcap.fill"),
            iconColor: .brown,
            title: "Learn poker",
            didTap: {
                handle(action: .ui(.learnPokerTapped))
            }
        )
    }
    
    private var emailLabel: some View {
        HStack {
             Spacer()
            (Text("Signed in as ") + Text(model.user.email))
                .font(.footnote)
                .foregroundStyle(Color.ijSecondaryLabel)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .listRowBackground(Color.ijSecondaryBackground)
    }

    private var signOutButton: some View {
        Button(
            role: .destructive,
            action: {
                handle(action: .ui(.signOutTapped))
            }) {
                Text("Sign out")
            }
            .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var deleteAccountButton: some View {
        Button(
            role: .destructive,
            action: {
                handle(action: .ui(.deleteAccountTapped))
            }) {
                Text("Delete account")
            }
            .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var profileInfoView: some View {
        Button(action: { handle(action: .ui(.profileImageTapped)) }) {
            HStack(spacing: 10) {
                playerImageView
                playerNameLabel
            }
        }
        .buttonStyle(.plain)
        .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var playerImageView: some View {
        EntityAvatarView(
            name: model.user.username,
            imageSource: .url(model.user.account?.imageURL),
        )
        .frame(width: 80, height: 80)
        .animation(.default, value: model.selectedImage)
    }
    
    private var playerNameLabel: some View {
        Text(model.user.username)
            .multilineTextAlignment(.leading)
            .font(.title2)
            .bold()
    }
    
    @ViewBuilder
    private var photoPicker: some View {
        ZStack {
            switch model.photoUploadState {
            case .idle, .uploaded:
                WithUIViewBackground { sourceView in
                    ListNavigationButton(
                        icon: Image(systemName: "photo"),
                        iconColor: .blue,
                        title: "Select profile photo",
                        didTap: {
                            handle(action: .ui(.selectProfileImageTapped(sourceView: sourceView)))
                        }
                    )
                }
                
            case .uploading:
                HStack(spacing: 10) {
                    LoadingSpinnerView()
                    
                    Text("Updating profile photo...")
                        .foregroundStyle(Color.ijSecondaryLabel)
                }
            }
        }
        .animation(.default, value: model.photoUploadState)
        .listRowBackground(Color.ijSecondaryBackground)
    }
    
    @ViewBuilder
    private var debugMenuButton: some View {
        if model.isDebugMenuEnabled {
            ListNavigationButton(
                icon: Image(systemName: "ladybug.fill"),
                iconColor: .pink,
                title: "Debug menu",
                didTap: {
                    handle(action: .ui(.debugMenuTapped))
                }
            )
        } else {
            Rectangle()
                .fill(Color.ijBackground)
                .frame(height: 100)
                .listRowBackground(Color.clear)
                .onTapGesture(count: 10) {
                    handle(action: .ui(.debugMenuEnabled))
                }
        }
    }
    
    private var soundEffectsToggle: some View {
        HStack(spacing: 10) {
            ListNavigationIconView(
                icon: Image(systemName: "speaker.wave.2"),
                iconColor: .cyan
            )
            .environment(\.horizontalSizeClass, .compact)

            Toggle(
                "Sound effects",
                isOn: .init(
                    get: { model.isSoundEffectsEnabled },
                    set: { handle(action: .ui(.soundsEffectsToggled(isOn: $0))) }
                )
            )
        }
        .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var notificationsStatusBanner: some View {
        NotificationsStatusBannerView(
            authorizationStatus: model.systemNotificationSettings.authorizationStatus,
            handleAction: { action in
                handle(action: .ui(.notificationsStatusBanner(action)))
            }
        )
        .listRowBackground(Color.ijSecondaryBackground)
    }
}
