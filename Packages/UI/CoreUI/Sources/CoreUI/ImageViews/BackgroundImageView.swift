import NukeUI
import SwiftUI

public struct BackgroundImageView: View {
    private let imageSource: ImageSource
    
    public var body: some View {
        ZStack(alignment: .top) {
            imageView
            topGradient
        }
    }
    
    public init(
        imageSource: ImageSource
    
    ) {
        self.imageSource = imageSource
    }
}

// MARK: - Subviews
extension BackgroundImageView {
    @ViewBuilder
    private var imageView: some View {
        ZStack {
            switch imageSource {
            case .image(let image):
                localImageView(image: image)
                
            case .uiImage(let uiImage):
                localImageView(image: Image(uiImage: uiImage))

            case .url(let url):
                remoteImageView(url: url)
            }
        }
        .overlay(Color.black.opacity(0.3))
        .clipped()
        .ignoresSafeArea(edges: .bottom)
        .animation(.default, value: imageSource)
    }
    
    private func localImageView(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }

    private func remoteImageView(url: URL?) -> some View {
        LazyImage(url: url) { response in
            if let image: Image = response.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
    
    private var topGradient: some View {
        LinearGradient(
            colors: [
                Color.black.opacity(0.8),
                Color.clear, 
                Color.clear,
                Color.clear,
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
