import CoreUI
import SwiftUI

public struct AddAttachmentButton: View {
    private let handleAction: (AddAttachmentAction) -> Void

    public var body: some View {
        Menu(
            content: {
                ForEach(AddAttachmentAction.allCases, id: \.self) { action in
                    Button(action: { handleAction(action) }) {
                        Label(
                            title: { Text(action.buttonTitle) },
                            icon: { Image(systemName: action.iconName) }
                        )
                        .foregroundStyle(Color.ijLabel)
                    }
                }
            },
            label: {
                Image(systemName: "plus.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.ijBackground, Color.ijSecondaryLabel)
                    .font(.title)
            }
        )
    }
    
    public init(
        handleAction: @escaping (AddAttachmentAction) -> Void
    ) {
        self.handleAction = handleAction
    }
}

