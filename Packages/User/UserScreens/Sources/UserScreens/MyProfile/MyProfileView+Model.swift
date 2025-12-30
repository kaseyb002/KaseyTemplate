import Foundation
@preconcurrency import PhotosUI
import SwiftUI
import UserModel
@preconcurrency import UserNotifications

extension MyProfileView {
    struct Model: Sendable {
        var user: User
        var selectedPhotosPickerItem: PhotosPickerItem?
        var selectedImage: UIImage?
        var photoUploadState: PhotoUploadState = .idle
        var isDebugMenuEnabled: Bool
        var isSoundEffectsEnabled: Bool
        var systemNotificationSettings: UNNotificationSettings

        enum PhotoUploadState: Sendable {
            case idle
            case uploading
            case uploaded
        }
    }
}
