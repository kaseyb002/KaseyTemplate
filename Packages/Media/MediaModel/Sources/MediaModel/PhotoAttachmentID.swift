import Extensions
import Foundation

public struct PhotoAttachmentID: EntityID, Sendable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

