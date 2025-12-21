import MediaClient
import MediaModel
import UIKit

public final actor DefaultMediaDataStore {
    private let client: MediaClient
    
    public init(
        client: MediaClient
    ) {
        self.client = client
    }
    
    public func upload(
        media: MediaUpload
    ) async throws -> MediaAttachment {
        try await client.upload(media: media)
    }

    public func upload(
        image: UIImage
    ) async throws -> URL {
        try await client.upload(image: image)
    }
}
