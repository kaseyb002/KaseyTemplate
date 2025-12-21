import Foundation
import UIKit

public protocol ImageLoader: Actor, Sendable {
    func setup() async throws
    
    func download(
        imageURL: URL
    ) async throws -> ImageResponse
    
    func cache(
        image: UIImage,
        url: URL
    ) async throws
}
