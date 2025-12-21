import AuthModel
import Foundation
import KaseyHTTP
import HTTP

struct SignInWithGoogleRequest: HTTP.HTTPRequest {
    typealias ResponseType = KeyResponse
    
    let path: String = "/auth/google"
    let token: String
    let method: HTTPMethod = .post
    
    var body: (any HTTPBody)? {
        JSONBody([
            "access_token": token,
        ])
    }
}
