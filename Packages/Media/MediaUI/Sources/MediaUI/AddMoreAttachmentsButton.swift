import Colors
import CoreUI
import SwiftUI

public struct AddMoreAttachmentsButton: View {
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
                ZStack {
                    Color.clear
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundStyle(Color.ijSeparator)
                }
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            Color.ijSeparator,
                            style: StrokeStyle(
                                lineWidth: 2,
                                dash: [5],
                                dashPhase: 1
                            )
                        )
                }
            }
        )
    }

    public init(
        handleAction: @escaping (AddAttachmentAction) -> Void
    ) {
        self.handleAction = handleAction
    }
}
