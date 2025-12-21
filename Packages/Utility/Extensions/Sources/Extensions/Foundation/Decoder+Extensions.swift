import Foundation

extension KeyedDecodingContainer where K: CodingKey {
    public func stringThatMightBeAnInt(
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> String {
        if let intID: Int = try? decode(Int.self, forKey: key) {
            String(intID)
        } else {
            try decode(String.self, forKey: key)
        }
    }
    
    public func decimalFromString(
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> Decimal {
        if let stringValue: String = try? decode(String.self, forKey: key) {
            guard let decimalValue: Decimal = .init(string: stringValue) else {
                throw DecodingError.typeMismatch(
                    Decimal.self,
                    .init(
                        codingPath: [key],
                        debugDescription: "Could not convert String to Decimal type."
                    )
                )
            }
            return decimalValue
        } else {
            return try decode(Decimal.self, forKey: key)
        }
    }
    
    public func stringTreatingEmptyAsNil(
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> String? {
        guard let string: String = try decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        if string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return nil
        }
        return string
    }
}
