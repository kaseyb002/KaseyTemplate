import Foundation
import GroupModel
import HTTP
import KaseyHTTP
import NotificationsModel
import UserModel

struct RegisterPushIDRequest: HTTPRequest {
    typealias ResponseType = EmptyResponse
    
    let pushID: String
    
    var path: String { "/account/my_user/push_registration" }
    let method: HTTPMethod = .post
    
    var body: (any HTTPBody)? {
        JSONBody([
            "push_id": pushID,
        ])
    }
}
