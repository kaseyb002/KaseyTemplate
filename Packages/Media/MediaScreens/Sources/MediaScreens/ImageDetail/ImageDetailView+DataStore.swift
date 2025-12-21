import ImageLoader
import UIKit

// MARK: - DataStore
public protocol ImageDetailViewDataStore: Actor, Sendable {
    func download(imageURL: URL) async throws -> ImageResponse
}
