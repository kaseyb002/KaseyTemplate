import AuthModel
import DebugModel
import Foundation
import Colors
import CoreUI
import UserModel
@preconcurrency import UserNotifications

extension MyProfileView {
    nonisolated static func load(
        dataStore: MyProfileViewDataStore,
        requiredData: MyProfileViewRequiredData,
        isPresentedModally: Bool,
    ) async throws -> Model {
        async let user: User = dataStore.myUser()
        async let isSoundEffectsEnabled: Bool = dataStore.settingValue(\.isSoundEffectsEnabled)
        async let systemNotificationSettings: UNNotificationSettings = dataStore.notificationSettings()
        async let debugConfig: DebugConfig = dataStore.debugConfig()
        return try await Model(
            user: user,
            isDebugMenuEnabled: debugConfig.isDebugMenuEnabled,
            isSoundEffectsEnabled: isSoundEffectsEnabled,
            systemNotificationSettings: systemNotificationSettings,
        )
    }
}
