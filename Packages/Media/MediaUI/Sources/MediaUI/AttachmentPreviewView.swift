import Colors
import CoreUI
import MediaModel
import SwiftUI

public struct AttachmentPreviewView: View {
    private let state: AttachmentUploadUIState
    private let isEditingEnabled: Bool
    private let handleAction: (AttachmentPreviewOptionsAction) -> Void
    
    public var body: some View {
        ZStack {
            switch state {
            case .uploading:
                loadingView
                
            case .uploaded(let mediaAttachment):
                if isEditingEnabled {
                    loadedView(mediaAttachment)
                } else {
                    readOnlyAttachmentView(mediaAttachment)
                }

            case .uploadFailed:
                errorView
            }
        }
        .animation(.default, value: state)
    }
    
    public init(
        state: AttachmentUploadUIState,
        isEditingEnabled: Bool,
        handleAction: @escaping (AttachmentPreviewOptionsAction) -> Void
    ) {
        self.state = state
        self.isEditingEnabled = isEditingEnabled
        self.handleAction = handleAction
    }
}

// MARK: - Subviews
extension AttachmentPreviewView {
    private var loadingView: some View {
        LoadingSpinnerView()
            .frame(width: 150)
    }
    
    private var errorView: some View {
        HStack(spacing: 2) {
            Image(systemName: "exclamationmark.triangle")
            Text("Upload failed")
        }
        .foregroundStyle(Color.red)
        .font(.footnote)
    }
    
    @ViewBuilder
    private func loadedView(_ attachment: MediaAttachment) -> some View {
        Menu(
            content: {
                ForEach(AttachmentPreviewOptionsAction.allCases, id: \.self) { action in
                    Button(
                        role: action.buttonRole,
                        action: { handleAction(action) },
                        label: {
                            Label(
                                title: { Text(action.buttonTitle) },
                                icon: { Image(systemName: action.iconName) }
                            )
                        }
                    )
                }
            },
            label: {
                attachmentView(attachment)
            }
        )
    }
    
    private func readOnlyAttachmentView(_ attachment: MediaAttachment) -> some View {
        Button(action: { handleAction(.viewAttachment) }) {
            attachmentView(attachment)
        }
    }
    
    @ViewBuilder
    private func attachmentView(_ attachment: MediaAttachment) -> some View {
        switch attachment.attachment {
        case .giphy(let giphyAttachment):
            AnimatedGifView(url: giphyAttachment.giphyURL)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
        case .photo(let photoAttachment):
            AttachmentImageView(imageURL: photoAttachment.imageURL)
        }
    }
}
