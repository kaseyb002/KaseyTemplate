import Extensions
import Foundation

extension MediaUpload {
    public static func fake(
        uploadType: MediaUploadType = .giphy(.fake()),
        uploadStarted: Date
    ) -> MediaUpload {
        .init(
            uploadType: uploadType,
            uploadStarted: uploadStarted
        )
    }
}

