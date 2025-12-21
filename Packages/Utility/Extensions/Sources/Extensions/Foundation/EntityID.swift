import Foundation

public protocol EntityID: Hashable, RawRepresentable<String>, Codable, Sendable {
    
}

extension EntityID {
    public static func fake() -> Self {
        .init(rawValue: UUID().uuidString)!
    }
}

extension String.StringInterpolation {
    public mutating func appendInterpolation<ID: EntityID>(_ value: ID) {
        appendLiteral(value.rawValue)
    }
}
