import SwiftUI

extension View {
    public func addAttachmentContextMenu(
        handleAction: @escaping (AddAttachmentAction) -> Void
    ) -> some View {
        self.contextMenu(menuItems: {
            ForEach(AddAttachmentAction.allCases, id: \.self) { action in
                Button(action: { handleAction(action) }) {
                    Text(action.buttonTitle)
                }
            }
        })
    }
}

public enum AddAttachmentAction: CaseIterable {
    case addPhotoTapped
    case addCameraPhotoTapped
    case addGIFTapped
    
    var buttonTitle: String {
        switch self {
        case .addPhotoTapped:
            "Photo"
        case .addCameraPhotoTapped:
            "Camera"
        case .addGIFTapped:
            "GIF"
        }
    }
    
    var iconName: String {
        switch self {
        case .addPhotoTapped:
            "photo"
        case .addCameraPhotoTapped:
            "camera"
        case .addGIFTapped:
            "photo.on.rectangle.angled"
        }
    }
}
