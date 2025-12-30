import Foundation
import HTTP
import KaseyHTTP
import NotificationsModel
import GroupModel

struct GroupNotificationSettingsRequest: HTTPRequest {
    typealias ResponseType = GroupNotificationSettings
    
    let groupID: GroupID
    
    var path: String { "/group/\(groupID)/notification_settings" }
}
