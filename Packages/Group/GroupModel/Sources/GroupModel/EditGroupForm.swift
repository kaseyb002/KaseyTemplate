import Foundation
import Extensions

public struct EditGroupForm: Equatable, Encodable {
    public let groupID: GroupID
    public var name: String?
    public var imageURL: NullableFormField<URL>?

    public init(
        groupID: GroupID,
        name: String? = nil,
        imageURL: NullableFormField<URL>? = nil
    ) {
        self.groupID = groupID
        self.name = name
        self.imageURL = imageURL
    }
}
