import Combine
import Foundation
import GroupModel
import HTTP
import KaseyHTTP
import NotificationsModel

public final class DefaultNotificationsClient: NotificationsClient {
    private let authedHTTPClient: any HTTP.HTTPClient
    private let encoder: JSONEncoder
    
    public init(
        authedHTTPClient: any HTTP.HTTPClient,
        encoder: JSONEncoder,
    ) {
        self.authedHTTPClient = authedHTTPClient
        self.encoder = encoder
    }
    
    public func editGroupNotificationSettings(
        form: EditGroupNotificationSettingsForm
    ) async throws -> GroupNotificationSettings {
        let request: EditGroupNotificationSettingsRequest = .init(
            form: form,
            encoder: encoder,
        )
        return try await authedHTTPClient.send(request)
    }
    
    public func groupNotificationSettings(
        groupID: GroupID
    ) async throws -> GroupNotificationSettings {
        let request: GroupNotificationSettingsRequest = .init(groupID: groupID)
        return try await authedHTTPClient.send(request)
    }
    
    public func register(pushID: String) async throws {
        let request: RegisterPushIDRequest = .init(pushID: pushID)
        _ = try await authedHTTPClient.send(request)
    }
    
    public func deletePushRegistration(pushID: String) async throws {
        let request: DeletePushRegistrationRequest = .init(pushID: pushID)
        _ = try await authedHTTPClient.send(request)
    }
}
