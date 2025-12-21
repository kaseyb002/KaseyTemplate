import Foundation

@propertyWrapper
public struct AlwaysEqual<Value: Sendable>: Equatable, Sendable {
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public static func == (
        lhs: AlwaysEqual<Value>,
        rhs: AlwaysEqual<Value>
    ) -> Bool {
        true
    }
}
