import MediaClient
import MediaModel
import UIKit

public protocol MediaDataStore: Actor, Sendable {
    func upload(
        media: MediaUpload
    ) async throws -> MediaAttachment

    func upload(
        image: UIImage
    ) async throws -> URL
}
