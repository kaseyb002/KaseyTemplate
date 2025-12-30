import Foundation
import HTTP
import KaseyHTTP

struct DeleteAccountRequest: HTTPRequest {
    typealias ResponseType = DeleteAccountResponse
    
    let path: String = "/account/delete"
    let method: HTTPMethod = .delete
}

struct DeleteAccountResponse: Codable {
    let detail: String
}
