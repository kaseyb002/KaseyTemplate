import Foundation
import HTTP
import KaseyHTTP
import UserModel

struct MyUserRequest: HTTPRequest {
    typealias ResponseType = User
    
    let path: String = "/account/my_user"
}
