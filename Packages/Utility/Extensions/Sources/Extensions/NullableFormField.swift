import Foundation

/// For JSON-encoded fields that can be set to `null`
public enum NullableFormField<Value: Equatable & Encodable & Sendable>: Equatable, Encodable, Sendable {
    /// Set the field with this value
    case value(Value)
    /// Set this field to `null`
    case null
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .value(let value):
            try container.encode(value)
            
        case .null:
            try container.encodeNil()
        }
    }
}
