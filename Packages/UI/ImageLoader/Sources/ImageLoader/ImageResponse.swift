import Nuke
import UIKit

public struct ImageResponse: Sendable {
    public let image: UIImage
    public let cacheType: CacheType?

    public enum CacheType: Sendable {
        case onDisk
        case inMemory
    }

    public init(
        image: UIImage,
        cacheType: ImageResponse.CacheType?
    ) {
        self.image = image
        self.cacheType = cacheType
    }

    init(
        nukeResponse: Nuke.ImageResponse
    ) {
        self.image = nukeResponse.image
        guard let nukeCacheType: Nuke.ImageResponse.CacheType = nukeResponse.cacheType else {
            self.cacheType = nil
            return
        }
        switch nukeCacheType {
        case .memory:
            self.cacheType = .inMemory
        case .disk:
            self.cacheType = .onDisk
        }
    }
}
