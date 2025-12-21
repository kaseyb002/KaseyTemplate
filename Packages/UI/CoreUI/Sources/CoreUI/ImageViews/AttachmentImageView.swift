import NukeUI
import SwiftUI

public struct AttachmentImageView: View {
    private let imageURL: URL

    public var body: some View {
        LazyImage(url: imageURL) { response in
            if let image: Image = response.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Color.gray
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    public init(imageURL: URL) {
        self.imageURL = imageURL
    }
}
