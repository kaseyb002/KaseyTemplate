import Extensions
import Nuke
import NukeUI
import SwiftUI

public struct EntityAvatarView: View {
    private let name: String
    private let imageSource: ImageSource?
    
    public var body: some View {
        avatarImage
    }
    
    public init(
        name: String,
        imageSource: ImageSource?
    ) {
        self.name = name
        self.imageSource = imageSource
    }
}

extension EntityAvatarView {
    @MainActor
    @ViewBuilder
    private var avatarImage: some View {
        switch imageSource {
        case .image(let image):
            localImageView(image: image)
            
        case .uiImage(let uiImage):
            localUIImageView(uiImage: uiImage)
            
        case .url(let url):
            remoteImageView(imageURL: url)

        case .none:
            avatarPlaceholder
        }
    }
    
    @MainActor
    private func remoteImageView(imageURL: URL?) -> some View {
        LazyImage(url: imageURL) { response in
            if let image: Image = response.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.gray)
            } else {
                avatarPlaceholder
            }
        }
        .applyImageResizing(contentMode: .aspectFill)
        .clipShape(Circle())
        .accessibilityLabel("Image of \(name)")
    }
    
    private func localUIImageView(uiImage: UIImage) -> some View {
        DownsampledUIImageView(
            image: uiImage,
            cacheKey: String(uiImage.hashValue),
            contentMode: .fill
        )
        .aspectRatio(contentMode: .fill)
        .background(Color.gray)
        .clipShape(Circle())
        .accessibilityLabel("Image of \(name)")
    }
    
    private func localImageView(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(Color.gray)
            .clipShape(Circle())
            .accessibilityLabel("Image of \(name)")
    }
    
    private var avatarPlaceholder: some View {
        Color.gray
            .overlay {
                nameInitialsLabel
            }
            .clipShape(Circle())
            .accessibilityLabel("Image of \(name)")
    }
    
    private var nameInitialsLabel: some View {
        Text(nameInitials)
            .foregroundStyle(.white)
            .font(.title2)
            .bold()
            .minimumScaleFactor(0.2)
            .padding(3)
    }
    
    private var nameInitials: String {
        guard let firstLetter: Character = name.first else {
            return "Unknown"
        }
        return String(firstLetter).uppercased()
    }
}
