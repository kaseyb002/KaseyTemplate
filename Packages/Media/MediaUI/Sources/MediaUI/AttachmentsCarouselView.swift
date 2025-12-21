import MediaModel
import SwiftUI

public struct AttachmentsCarouselView: View {
    private let attachments: [AttachmentUploadUIState]
    private let maxAllowed: Int
    private let mode: Mode
    private let handleAction: (Action) -> Void
    
    public enum Action {
        case previewOptionTapped(
            AttachmentPreviewOptionsAction,
            attachment: AttachmentUploadUIState
        )
        case addMoreTapped(AddAttachmentAction)
    }
    
    public enum Mode {
        case readOnly
        case edit
        
        public var isEditingEnabled: Bool {
            switch self {
            case .readOnly:
                false
                
            case .edit:
                true
            }
        }
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(attachments, id: \.id) { attachment in
                    attachmentView(attachment: attachment)
                }
                addMoreButtonIfNeeded
            }
        }
        .contentMargins(10)
        .scrollIndicators(.hidden)
        .animation(.default, value: attachments)
    }
    
    public init(
        attachments: [AttachmentUploadUIState],
        maxAllowed: Int = 10,
        mode: Mode,
        handleAction: @escaping (Action) -> Void
    ) {
        self.attachments = attachments
        self.maxAllowed = maxAllowed
        self.mode = mode
        self.handleAction = handleAction
    }
}

// MARK: - Subviews
extension AttachmentsCarouselView {
    private func attachmentView(attachment: AttachmentUploadUIState) -> some View {
        AttachmentPreviewView(
            state: attachment,
            isEditingEnabled: mode.isEditingEnabled,
            handleAction: { action in
                handleAction(
                    .previewOptionTapped(
                        action,
                        attachment: attachment
                    )
                )
            }
        )
    }
    
    @ViewBuilder
    private var addMoreButtonIfNeeded: some View {
        if attachments.count < maxAllowed,
           mode.isEditingEnabled {
            AddMoreAttachmentsButton(handleAction: { handleAction(.addMoreTapped($0)) })
        }
    }
}
