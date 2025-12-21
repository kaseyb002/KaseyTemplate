import MediaModel
import UIKit

public protocol MediaClient: Actor, Sendable {
    func upload(media: MediaUpload) async throws -> MediaAttachment
    
    func upload(image: UIImage) async throws -> URL
}
