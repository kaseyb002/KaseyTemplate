import Foundation
import NotificationsModel

extension DebugURLHandlerView {
    struct Model: Sendable {
        let pushCount: Int
        let modalCount: Int
        let urls: [URLDestination]
        let pushNotificationAppActions: [PushNotificationAppAction]
        let isPresentedModally: Bool
        
        struct URLDestination: Equatable, Identifiable {
            var id: String {
                url.absoluteString
            }
            let url: URL
            let title: String
        }
    }
}

extension DebugURLHandlerView.Model {

}
