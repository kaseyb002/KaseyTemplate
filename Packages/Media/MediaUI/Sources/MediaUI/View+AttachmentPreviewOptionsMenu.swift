import SwiftUI

public enum AttachmentPreviewOptionsAction: CaseIterable {
    case deleteAttachment
    case viewAttachment
    
    var buttonTitle: String {
        switch self {
        case .deleteAttachment:
            "Delete"
        case .viewAttachment:
            "View"
        }
    }
    
    var iconName: String {
        switch self {
        case .deleteAttachment:
            "trash"
        case .viewAttachment:
            "eye"
        }
    }
    
    var buttonRole: ButtonRole? {
        switch self {
        case .deleteAttachment:
            .destructive

        case .viewAttachment:
            nil
        }
    }
}
