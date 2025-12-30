import Combine
import Foundation

extension MyProfileView {
    func subscribeToUpdates() async -> Set<AnyCancellable> {
        await [
            deps.dataStore.userDidRefresh
                .receive(on: DispatchQueue.main)
                .sink { user in
                    handle(action: .dataUpdate(.userUpdated(user)))
                },
            
            deps.dataStore.didUpdateNotificationsAuthorizationStatus
                .receive(on: DispatchQueue.main)
                .sink { settings in
                    handle(action: .dataUpdate(.notificationSettingsUpdated(settings)))
                },
        ]
    }
}
