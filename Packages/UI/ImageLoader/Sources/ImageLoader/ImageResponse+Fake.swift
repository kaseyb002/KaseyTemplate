import UIKit

extension ImageResponse {
    public static func fake() -> ImageResponse {
        .init(
            image: UIImage(systemName: "person")!,
            cacheType: .onDisk
        )
    }
}

