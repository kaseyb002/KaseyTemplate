import Foundation
import HTTP
import KaseyHTTP
import MediaModel

struct UploadImageMediaRequest: HTTPRequest {
    typealias ResponseType = MediaAttachment
    
    struct Form: Encodable {
        let uploadStarted: Date
        let clientID: MediaAttachmentID?
        let photoMedia: PhotoMedia
        
        enum CodingKeys: String, CodingKey {
            case uploadStarted = "upload_started"
            case clientID = "client_id"
            case photoMedia = "photo_media"
        }
        
        struct PhotoMedia: Encodable {
            let imageURL: URL
            
            enum CodingKeys: String, CodingKey {
                case imageURL = "image_url"
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
