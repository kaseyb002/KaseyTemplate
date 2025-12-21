import SwiftUI

public struct StatusMessageLabel: View {
    private let message: String
    private let icon: Icon?

    public enum Icon {
        case checkmark
    }

    public var body: some View {
        HStack(spacing: 3) {
            iconViewIfNeeded
            messageLabel
        }
        .multilineTextAlignment(.leading)
        .statusBackground()
    }
    
    public init(
        message: String,
        icon: Icon? = nil
    ) {
        self.message = message
        self.icon = icon
    }
}

// MARK: - Subviews
extension StatusMessageLabel {
    @ViewBuilder
    private var iconViewIfNeeded: some View {
        switch icon {
        case .checkmark:
            Image(systemName: "checkmark.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .green)
            
        case .none:
            EmptyView()
        }
    }
    
    private var messageLabel: some View {
        Text(message)
            .lineLimit(2)
            .font(.footnote)
            .foregroundStyle(Color.ijLabel)
    }
}

