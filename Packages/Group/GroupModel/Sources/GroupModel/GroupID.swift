import Extensions
import Foundation

public struct GroupID: EntityID {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
