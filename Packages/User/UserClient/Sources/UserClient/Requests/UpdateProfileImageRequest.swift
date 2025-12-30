import Foundation
import HTTP
import KaseyHTTP
import UserModel

struct UpdateProfileImageRequest: HTTPRequest {
    typealias ResponseType = User

    let path: String = "/account/my_user/profile_image"
    let method: HTTPMethod = .put
    
    let url: URL
    
    var body: (any HTTPBody)? {
        JSONBody([
            "image_url": url.absoluteString,
        ])
    }
}
