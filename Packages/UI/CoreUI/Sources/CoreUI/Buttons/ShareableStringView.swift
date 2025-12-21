import SwiftUI

public struct ShareableStringView<StringLabelView: View>: View {
    private let stringLabelView: StringLabelView
    private let header: String
    private let handleAction: (ShareableStringViewAction) -> Void

    public var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            copyShareTextHeaderLabel
            HStack(spacing: 20) {
                stringLabelView
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                shareButton
                copyButton
            }
            .padding()
            .background(Color.ijSecondaryBackground)
            .mask(RoundedRectangle(cornerRadius: 15))
        }
    }
    
    public init(
        string: String,
        header: String,
        handleAction: @escaping (ShareableStringViewAction) -> Void
    ) where StringLabelView == Text {
        self.init(
            stringLabelView: {
                Text(string)
                    .foregroundStyle(Color.ijLabel)
            },
            header: header,
            handleAction: handleAction
        )
    }
    
    public init(
        stringLabelView: @escaping () -> StringLabelView,
        header: String,
        handleAction: @escaping (ShareableStringViewAction) -> Void
    ) {
        self.stringLabelView = stringLabelView()
        self.header = header
        self.handleAction = handleAction
    }
}

extension ShareableStringView {
    private var copyButton: some View {
        Button(action: { handleAction(.copyTapped) }) {
            Image(systemName: "doc.on.doc")
                .foregroundStyle(Color.ijInteractive)
                .font(.title2)
        }
    }
    
    private var shareButton: some View {
        Button(action: { handleAction(.shareTapped) }) {
            Image(systemName: "square.and.arrow.up")
                .foregroundStyle(Color.ijInteractive)
                .font(.title2)
        }
    }
    
    private var copyShareTextHeaderLabel: some View {
        Text(header)
            .font(.caption)
            .foregroundStyle(Color.ijSecondaryLabel)
    }
}

private extension View {
    func copyShareTextBackground() -> some View {
        self
            .padding()
            .background(Color.ijSecondaryBackground)
            .mask(RoundedRectangle(cornerRadius: 10))
    }
}

public enum ShareableStringViewAction {
    case copyTapped
    case shareTapped
}
