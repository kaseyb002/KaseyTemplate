import Foundation
import KaseyHTTP
import HTTP
import MediaModel

struct UploadGiphyMediaRequest: HTTPRequest {
    typealias ResponseType = MediaAttachment
    
    struct Form: Encodable {
        let uploadStarted: Date
        let clientID: MediaAttachmentID?
        let giphyMedia: GiphyMedia
        
        enum CodingKeys: String, CodingKey {
            case uploadStarted = "upload_started"
            case clientID = "client_id"
            case giphyMedia = "giphy_media"
        }
        
        struct GiphyMedia: Encodable {
            let giphyID: String
            let giphyURL: URL
            
            enum CodingKeys: String, CodingKey {
                case giphyID = "giphy_id"
                case giphyURL = "giphy_url"
            }
        }
    }

    let form: Form
    let path: String = "/media/attachments"
    let method: HTTPMethod = .post
    let encoder: JSONEncoder
    
    var body: (any HTTPBody)? {
        JSONBody(form, encoder: encoder)
    }
}
