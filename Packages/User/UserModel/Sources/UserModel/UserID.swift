import Extensions
import Foundation

public struct UserID: EntityID {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
