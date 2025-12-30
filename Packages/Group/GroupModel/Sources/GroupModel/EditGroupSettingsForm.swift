import Foundation
import Extensions

public struct EditGroupSettingsForm: Equatable, Encodable {
    public let groupID: GroupID
    public var audioChannelID: NullableFormField<String>?
    public var backgroundImageURL: NullableFormField<URL>?

    public init(
        groupID: GroupID,
        audioChannelID: NullableFormField<String>? = nil,
        backgroundImageURL: NullableFormField<URL>? = nil
    ) {
        self.groupID = groupID
        self.audioChannelID = audioChannelID
        self.backgroundImageURL = backgroundImageURL
    }
}
