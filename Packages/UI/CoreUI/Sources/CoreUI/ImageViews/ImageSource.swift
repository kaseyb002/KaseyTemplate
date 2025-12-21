import SwiftUI

public enum ImageSource: Equatable, Sendable {
    case image(Image)
    case url(URL?)
    case uiImage(UIImage)
}
