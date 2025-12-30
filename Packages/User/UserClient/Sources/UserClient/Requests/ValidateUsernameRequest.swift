import Foundation
import HTTP
import KaseyHTTP
import UserModel

struct ValidateUsernameRequest: HTTPRequest {
    typealias ResponseType = ValidateUsernameResponse

    let path: String = "/account/my_user/username/validate"
    
    let username: String
    
    var queryItems: [URLQueryItem]? {
        [
            .init(name: "username", value: username),
        ]
    }
}
