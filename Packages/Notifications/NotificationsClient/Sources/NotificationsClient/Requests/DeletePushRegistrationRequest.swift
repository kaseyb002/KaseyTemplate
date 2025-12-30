import Foundation
import HTTP
import KaseyHTTP
import NotificationsModel
import UserModel

struct DeletePushRegistrationRequest: HTTPRequest {
    typealias ResponseType = EmptyResponse
    
    let pushID: String
    
    var path: String { "/account/my_user/push_registration" }
    let method: HTTPMethod = .delete
    
    var body: (any HTTPBody)? {
        JSONBody([
            "push_id": pushID,
        ])
    }
}
