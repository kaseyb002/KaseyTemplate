import Foundation
import GroupModel
import NotificationsModel

public protocol NotificationsClient {
    func groupNotificationSettings(
        groupID: GroupID
    ) async throws -> GroupNotificationSettings
    
    func editGroupNotificationSettings(
        form: EditGroupNotificationSettingsForm
    ) async throws -> GroupNotificationSettings
    
    func register(pushID: String) async throws
    
    func deletePushRegistration(pushID: String) async throws
}
