import Extensions
import Foundation

extension MediaAttachment {
    public static func fake(
        id: MediaAttachmentID = .fake(),
        clientID: MediaAttachmentID? = .fake(),
        uploadStarted: Date = .now.addingTimeInterval(.random(in: 1 ... 10_000)),
        attachment: AttachmentType = .giphy(.fake())
    ) -> MediaAttachment {
        .init(
            id: id,
            clientID: clientID,
            uploadStarted: uploadStarted,
            attachment: attachment
        )
    }
}

