import Foundation

public enum AttachmentUploadUIState: Hashable, Identifiable, Sendable {
    case uploading(MediaUpload)
    case uploaded(MediaAttachment)
    case uploadFailed(MediaUpload)
    
    public var id: String {
        if let mediaAttachment: MediaAttachment {
            return mediaAttachment.mediaIdentitifer
        } else if let mediaUpload: MediaUpload {
            return mediaUpload.mediaIdentitifer
        } else {
            return UUID().uuidString
        }
    }
    
    public var uploadStarted: Date {
        if let mediaAttachment: MediaAttachment {
            return mediaAttachment.uploadStarted
        } else if let mediaUpload: MediaUpload {
            return mediaUpload.uploadStarted
        } else {
            return .now
        }
    }
    
    public var mediaUpload: MediaUpload? {
        switch self {
        case .uploading(let mediaUpload):
            mediaUpload
            
        case .uploadFailed(let mediaUpload):
            mediaUpload

        case .uploaded:
            nil
        }
    }
    
    public var mediaAttachment: MediaAttachment? {
        switch self {
        case .uploading:
            nil
            
        case .uploadFailed:
            nil

        case .uploaded(let mediaAttachment):
            mediaAttachment
        }
    }
    
    public var isUploaded: Bool {
        switch self {
        case .uploading, .uploadFailed:
            false
            
        case .uploaded:
            true
        }
    }
}
