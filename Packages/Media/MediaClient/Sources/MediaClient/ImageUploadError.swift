import Extensions
import Foundation

public enum ImageUploadError {
    case failedToConvertToPNGData
    case failedToCreateURL
    case imageFileSizeTooLarge
    case r2UploadFailed
    case invalidR2Credentials
    case networkError
    case contentNotPermitted
}

extension ImageUploadError: DisplayableError {
    public var displayableErrorTitle: String {
        switch self {
        case .failedToConvertToPNGData:
            "Image type conversion failed"

        case .failedToCreateURL:
            "Failed to upload"
            
        case .imageFileSizeTooLarge:
            "Image size too large"
            
        case .r2UploadFailed:
            "Upload failed"
            
        case .invalidR2Credentials:
            "Invalid credentials"
            
        case .networkError:
            "Network error"
            
        case .contentNotPermitted:
            "Content not permitted"
        }
    }
    
    public var displayableErrorMessage: String? {
        switch self {
        case .failedToConvertToPNGData:
            "Please try a different image."
            
        case .failedToCreateURL:
            "Please try again."
            
        case .imageFileSizeTooLarge:
            "Images must be 5MB or less."
            
        case .r2UploadFailed:
            "Failed to upload to storage. Please try again."
            
        case .invalidR2Credentials:
            "Storage credentials are invalid. Please contact support."
            
        case .networkError:
            "Please check your internet connection and try again."
            
        case .contentNotPermitted:
            "The uploaded image contains content not permitted in this app."
        }
    }
}
