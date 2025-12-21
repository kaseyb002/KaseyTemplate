import Extensions
import Foundation

public struct MediaAttachmentID: EntityID, Sendable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
