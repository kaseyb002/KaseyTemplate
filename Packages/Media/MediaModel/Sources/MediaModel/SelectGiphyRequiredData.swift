import Foundation

public struct SelectGiphyRequiredData: Sendable {
    public let didSelectGiphy: @MainActor @Sendable (GiphyMedia) -> Void
    
    public init(
        didSelectGiphy: @MainActor @Sendable @escaping (GiphyMedia) -> Void
    ) {
        self.didSelectGiphy = didSelectGiphy
    }
}
