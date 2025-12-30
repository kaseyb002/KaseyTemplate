import Colors
import CoreUI
import Foundation
import ImageLoader

public final actor DefaultDataStore: DataStore {
    private let imageLoader: any ImageLoader
    
    public init(
        imageLoader: any ImageLoader
    ) {
        self.imageLoader = imageLoader
    }
}

extension DefaultDataStore {
    public func download(imageURL: URL) async throws -> ImageResponse {
        try await imageLoader.download(imageURL: imageURL)
    }
}
