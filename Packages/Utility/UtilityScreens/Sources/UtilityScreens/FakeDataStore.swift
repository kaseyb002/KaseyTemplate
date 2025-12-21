import ImageLoader
import UIKit

public final actor FakeDataStore: DataStore {
    public init() {}
    
    public func download(imageURL: URL) async throws -> ImageResponse {
        .fake()
    }
}
