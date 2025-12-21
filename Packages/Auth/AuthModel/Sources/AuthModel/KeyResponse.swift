import Foundation

public struct KeyResponse: Decodable, Sendable {
    public let key: String
    public let isNew: Bool?

    public init(
        key: String,
        isNew: Bool?
    ) {
        self.key = key
        self.isNew = isNew
    }
}
