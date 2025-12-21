import SwiftUI

extension ImageDetailView {
    struct Model: Sendable {
        let image: ImageType
        
        enum ImageType {
            case uiImage(UIImage)
            case image(Image)
        }
    }
}
