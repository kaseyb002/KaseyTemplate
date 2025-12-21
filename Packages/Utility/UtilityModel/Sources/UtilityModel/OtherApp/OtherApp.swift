import Extensions
import Foundation

public struct OtherApp: Equatable, Sendable {
    public let id: OtherAppID
    public let isSinglePlayer: Bool
    public let displayName: String
    public let description: String
    public let appStoreURL: URL
    public var writeReviewURL: URL {
        URL(string: appStoreURL.absoluteString + "?action=write-review")!
    }
    
    public init(
        id: OtherAppID,
        isSinglePlayer: Bool,
        displayName: String,
        description: String,
        appStoreURL: URL
    ) {
        self.id = id
        self.isSinglePlayer = isSinglePlayer
        self.displayName = displayName
        self.description = description
        self.appStoreURL = appStoreURL
    }
}
