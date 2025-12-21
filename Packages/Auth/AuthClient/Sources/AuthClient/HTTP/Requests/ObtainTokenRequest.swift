import AuthModel
import Foundation
import HTTP
import KaseyHTTP

struct ObtainTokenRequest: HTTP.HTTPRequest {
    typealias ResponseType = TokenResponse
    
    let path: String = "/account/api-token-auth"
    let username: String
    let password: String
    let method: HTTPMethod = .post
    
    var body: (any HTTPBody)? {
        JSONBody([
            "username": username,
            "password": password,
        ])
    }
}
