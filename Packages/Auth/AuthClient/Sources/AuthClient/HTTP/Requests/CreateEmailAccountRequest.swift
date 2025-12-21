import AuthModel
import Foundation
import HTTP
import KaseyHTTP

struct CreateEmailAccountRequest: HTTP.HTTPRequest {
    typealias ResponseType = TokenResponse
    
    let path: String = "/account/register"
    let emailAddress: String
    let password: String
    let method: HTTPMethod = .post
    
    var body: (any HTTPBody)? {
        JSONBody([
            "email": emailAddress,
            "password": password,
        ])
    }
}
