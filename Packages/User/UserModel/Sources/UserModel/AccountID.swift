import Extensions
import Foundation

public struct AccountID: EntityID, Sendable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

