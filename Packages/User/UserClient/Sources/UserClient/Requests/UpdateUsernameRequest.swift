import Foundation
import HTTP
import KaseyHTTP
import UserModel

struct UpdateUsernameRequest: HTTPRequest {
    typealias ResponseType = User

    let path: String = "/account/my_user/username"
    let method: HTTPMethod = .put
    
    let username: String
    
    var body: (any HTTPBody)? {
        JSONBody([
            "username": username,
        ])
    }
}
