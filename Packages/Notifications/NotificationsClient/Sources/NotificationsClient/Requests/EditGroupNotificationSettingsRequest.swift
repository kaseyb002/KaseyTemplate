import Foundation
import GroupModel
import HTTP
import KaseyHTTP
import NotificationsModel

struct EditGroupNotificationSettingsRequest: HTTP.HTTPRequest {
    typealias ResponseType = GroupNotificationSettings
    
    let form: EditGroupNotificationSettingsForm
    
    var path: String { "/group/\(form.groupID)/notification_settings" }
    let method: HTTPMethod = .put
    let encoder: JSONEncoder
    
    var body: (any HTTPBody)? {
        JSONBody(form, encoder: encoder)
    }
}
