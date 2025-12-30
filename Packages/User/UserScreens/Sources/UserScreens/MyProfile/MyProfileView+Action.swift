import DebugModel
import Foundation
import MediaModel
import NotificationsUI
import PhotosUI
import SwiftUI
import UserModel
import UtilityModel

extension MyProfileView {
    enum Action {
        case dataUpdate(DataUpdate)
        case ui(UI)

        enum UI {
            case changeUsernameTapped
            case debugMenuTapped
            case debugMenuEnabled
            case deleteAccountTapped
            case photoItemSelected(PhotosPickerItem?)
            case selectProfileImageTapped(sourceView: UIView)
            case profileImageTapped
            case sendFeedbackTapped
            case rateAppTapped
            case signOutTapped
            case signOutConfirmed
            case soundsEffectsToggled(isOn: Bool)
            case learnPokerTapped
            case otherApps
            case notificationsStatusBanner(NotificationsStatusBannerView.Action)
        }
        
        enum DataUpdate {
            case selectedImageLoaded(UIImage)
            case userUpdated(User)
            case notificationSettingsUpdated(UNNotificationSettings)
        }
    }
}

// MARK: - Handle
extension MyProfileView {
    func handle(action: MyProfileView.Action) {
        switch action {
        case .dataUpdate(let action):
            handle(data: action)
            
        case .ui(let action):
            handle(ui: action)
        }
    }
    
    private func handle(ui action: MyProfileView.Action.UI) {
        switch action {
        case .otherApps:
            deps.didSelectNavAction(.otherApps)

        case .profileImageTapped:
            guard let imageURL: URL = model.user.account?.imageURL else {
                return
            }
            deps.didSelectNavAction(.imageDetail(imageSource: .url(imageURL)))
            
        case .changeUsernameTapped:
            deps.didSelectNavAction(.chooseUsername)
            
        case .photoItemSelected(let item):
            model.selectedPhotosPickerItem = item
            guard let item: PhotosPickerItem else { return }
            Task {
                do {
                    guard let imageData: Data = try await item.loadTransferable(type: Data.self),
                          let image: UIImage = .init(data: imageData)
                    else {
                        return
                    }
                    await MainActor.run {
                        model.selectedImage = image
                        handle(data: .selectedImageLoaded(image))
                    }
                    
                } catch {
                    await MainActor.run {
                        deps.didSelectNavAction(.alert(.errorAlert(error)))
                    }
                }
            }
            
        case .sendFeedbackTapped:
            deps.didSelectNavAction(.sendFeedback)
            
        case .signOutConfirmed:
            Task {
                try await deps.dataStore.signOut()
                // appNavigator should dismiss to sign in view
            }
            
        case .signOutTapped:
            let alert: AlertModel = .init(
                title: "Sign out?",
                message: "Are you sure you want to sign out?",
                actions: [
                    .init(title: "Sign out", style: .destructive) {
                        handle(action: .ui(.signOutConfirmed))
                    },
                ]
            )
            deps.didSelectNavAction(.alert(alert))
            
        case .rateAppTapped:
            deps.didSelectNavAction(.rateApp)
            
        case .debugMenuTapped:
            deps.didSelectNavAction(.debugMenu)
            
        case .debugMenuEnabled:
            model.isDebugMenuEnabled = true
            Task {
                try await deps.dataStore.saveDebugConfig(\.isDebugMenuEnabled, value: true)
            }
            
        case .deleteAccountTapped:
            deps.didSelectNavAction(.deleteAccount)
            
        case .selectProfileImageTapped(let sourceView):
            let requiredData: ImagePickerRequiredData = .init(
                promptTitle: "Select Image",
                selectedOption: .prompt(sourceView: sourceView),
                didSelectImage: { image in
                    handleSelected(image: image)
                }
            )
            deps.didSelectNavAction(.imagePicker(requiredData))
            
        case .soundsEffectsToggled(let isOn):
            model.isSoundEffectsEnabled = isOn
            Task {
                _ = try await deps.dataStore.save(
                    setting: \.isSoundEffectsEnabled,
                    value: isOn
                )
            }
            
        case .learnPokerTapped:
            deps.didSelectNavAction(.learnPoker)
            
        case .notificationsStatusBanner(.systemSettingsTapped):
            deps.didSelectNavAction(.appSystemNotificationSettings)
            
        case .notificationsStatusBanner(.enableNotificationsTapped):
            Task {
                try await deps.dataStore.requestNotificationPermission()
            }
        }
    }
    
    private func handle(data action: MyProfileView.Action.DataUpdate) {
        switch action {
        case .selectedImageLoaded(let image):
            model.photoUploadState = .uploading
            Task {
                do {
                    let user: User = try await deps.dataStore.update(
                        profileImage: image
                    )
                    await MainActor.run {
                        model.user = user
                        model.photoUploadState = .uploaded
                    }
                } catch {
                    await MainActor.run {
                        model.photoUploadState = .idle
                        deps.didSelectNavAction(.alert(.errorAlert(error)))
                    }
                }
            }
            
        case .userUpdated(let user):
            model.user = user
            
        case .notificationSettingsUpdated(let systemNotificationSettings):
            model.systemNotificationSettings = systemNotificationSettings
        }
    }
    
    private func handleSelected(image: UIImage) {
        model.selectedImage = image
        handle(data: .selectedImageLoaded(image))
    }
}
