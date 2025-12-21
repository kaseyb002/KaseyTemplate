import SwiftUI
import SDWebImageSwiftUI

public struct AnimatedGifView: View {
    private let url: URL
    
    public var body: some View {
        AnimatedImage(url: url)
            .resizable()
            .scaledToFit()
    }

    public init(url: URL) {
        self.url = url
    }
}
