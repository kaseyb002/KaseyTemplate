import Foundation

/// Wrapped object so I don't have to add GiphySDK dep everywhere
public struct GiphyMedia: Hashable, Sendable {
    public let giphyID: String
    public let giphyURL: URL
    
    public init(
        giphyID: String,
        giphyURL: URL
    ) {
        self.giphyID = giphyID
        self.giphyURL = giphyURL
    }
}
