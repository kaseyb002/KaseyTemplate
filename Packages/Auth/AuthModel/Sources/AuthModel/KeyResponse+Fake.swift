import Foundation

extension KeyResponse {
    public static func fake(
        key: String = UUID().uuidString,
        isNew: Bool? = false,
    ) -> KeyResponse {
        .init(
            key: key,
            isNew: isNew,
        )
    }
}

