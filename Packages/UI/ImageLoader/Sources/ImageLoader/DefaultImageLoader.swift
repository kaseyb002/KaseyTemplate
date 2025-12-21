import Foundation
import Logger
import Nuke
import UIKit

public final actor DefaultImageLoader: ImageLoader {
    private let imagePipeline: Nuke.ImagePipeline
    
    public init() {
        self.imagePipeline = .shared
    }
    
    public func setup() async throws {
        // TODO: setup image cache sizes
    }
    
    public enum ImageError: Error, Sendable {
        case failedToDecodeImage
    }
    
    public func download(imageURL: URL) async throws -> ImageResponse {
        let task: Nuke.ImageTask = imagePipeline.imageTask(with: imageURL)
        let nukeImageResponse: Nuke.ImageResponse = try await task.response
        return .init(nukeResponse: nukeImageResponse)
    }
    
    public func cache(
        image: UIImage,
        url: URL
    ) async throws {
        imagePipeline.cache.storeCachedImage(.init(image: image), for: .init(url: url))
    }

    public func configureCache() {
        logIt(.debug, "DataLoader.sharedUrlCache.currentDiskUsage \(DataLoader.sharedUrlCache.currentDiskUsage)")
        logIt(.debug, "DataLoader.sharedUrlCache.currentMemoryUsage \(DataLoader.sharedUrlCache.currentMemoryUsage)")
        logIt(.debug, "DataLoader.sharedUrlCache.diskCapacity \(DataLoader.sharedUrlCache.diskCapacity)")
        logIt(.debug, "DataLoader.sharedUrlCache.memoryCapacity \(DataLoader.sharedUrlCache.memoryCapacity)")
    }

    public func totalCacheSize() -> Int {
        ImageCache.shared.totalCost
    }

    public func clearImageCache() async throws {
        imagePipeline.cache.removeAll()
        DataLoader.sharedUrlCache.removeAllCachedResponses()
    }
}
