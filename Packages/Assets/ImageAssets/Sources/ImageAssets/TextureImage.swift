import SwiftUI

public enum TextureImage: String, Equatable, CaseIterable {
    case bluePlastic
    case feltDark
    case feltLight
    case redPlastic
    case woodGrainDark
    case woodGrainLight
    case yellowPlastic

    public var image: Image {
        switch self {
        case .bluePlastic:
            Image(.Textures.bluePlastic)
        case .feltDark:
            Image(.Textures.feltDark)
        case .feltLight:
            Image(.Textures.feltLight)
        case .redPlastic:
            Image(.Textures.redPlastic)
        case .woodGrainDark:
            Image(.Textures.woodGrainDark)
        case .woodGrainLight:
            Image(.Textures.woodGrainLight)
        case .yellowPlastic:
            Image(.Textures.yellowPlastic)
        }
    }
    
    public var uiImage: UIImage {
        switch self {
        case .bluePlastic:
            UIImage(resource: .Textures.bluePlastic)
        case .feltDark:
            UIImage(resource: .Textures.feltDark)
        case .feltLight:
            UIImage(resource: .Textures.feltLight)
        case .redPlastic:
            UIImage(resource: .Textures.redPlastic)
        case .woodGrainDark:
            UIImage(resource: .Textures.woodGrainDark)
        case .woodGrainLight:
            UIImage(resource: .Textures.woodGrainLight)
        case .yellowPlastic:
            UIImage(resource: .Textures.yellowPlastic)
        }
    }
}
