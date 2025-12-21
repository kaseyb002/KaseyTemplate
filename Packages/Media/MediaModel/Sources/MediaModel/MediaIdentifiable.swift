import Foundation

/// Attempt to provide a means of equating `MediaUpload` and `MediaAttachment`
public protocol MediaIdentifiable {
    var mediaIdentitifer: String { get }
}
