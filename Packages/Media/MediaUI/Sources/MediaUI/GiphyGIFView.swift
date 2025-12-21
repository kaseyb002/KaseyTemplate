import GiphyUISDK
import SwiftUI

public struct GiphyGIFView: View {
    private let giphyURL: URL
    
    public var body: some View {
        Text(giphyURL.absoluteString)
    }
    
    public init(
        giphyURL: URL
    ) {
        self.giphyURL = giphyURL
    }
}
