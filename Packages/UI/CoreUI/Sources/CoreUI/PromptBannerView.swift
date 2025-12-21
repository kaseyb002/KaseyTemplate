import SwiftUI

public struct PromptBannerView: View {
    private let title: String
    private let detail: String?
    private let dismissButtonTitle: String
    private let primaryActionButtonTitle: String
    private let icon: Image?
    private let tappedDismiss: () -> Void
    private let tappedPrimaryActionButton: () -> Void
    
    public var body: some View {
        HStack(alignment: .top, spacing: 15) {
            iconViewIfNeeded
            VStack(alignment: .leading, spacing: 20) {
                labelsView
                buttonsView
            }
        }
        .padding(15)
        .background(Color.ijSecondaryFill)
        .mask(RoundedRectangle(cornerRadius: 15))
        .onTapGesture(perform: tappedPrimaryActionButton)
    }
    
    public init(
        title: String,
        detail: String?,
        dismissButtonTitle: String = "Dismiss",
        primaryActionButtonTitle: String,
        icon: Image?,
        tappedDismiss: @escaping () -> Void,
        tappedPrimaryActionButton: @escaping () -> Void
    ) {
        self.title = title
        self.detail = detail
        self.dismissButtonTitle = dismissButtonTitle
        self.primaryActionButtonTitle = primaryActionButtonTitle
        self.icon = icon
        self.tappedDismiss = tappedDismiss
        self.tappedPrimaryActionButton = tappedPrimaryActionButton
    }
}

// MARK: - Subviews
extension PromptBannerView {
    private var labelsView: some View {
        VStack(alignment: .leading, spacing: 2) {
            titleLabel
            subtitleLabelIfNeeded
        }
    }
    
    private var buttonsView: some View {
        HStack(spacing: .zero) {
            dismissButton
            Spacer()
            primaryActionButton
            Spacer()
        }
    }
    
    private var titleLabel: some View {
        Text(title)
            .foregroundStyle(Color.ijLabel)
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private var subtitleLabelIfNeeded: some View {
        if let detail: String {
            Text(detail)
                .foregroundStyle(Color.ijSecondaryLabel)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private var iconViewIfNeeded: some View {
        if let icon: Image {
            icon
                .font(.title2)
                .bold()
                .foregroundStyle(Color.ijLabel)
                .offset(y: 7)
        }
    }
    
    private var primaryActionButton: some View {
        Button(action: tappedPrimaryActionButton) {
            Text(primaryActionButtonTitle)
                .foregroundStyle(Color.white)
                .bold()
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.ijInteractive)
        }
        .mask(Capsule())
        .buttonStyle(.plain)
    }
    
    private var dismissButton: some View {
        Button(action: tappedDismiss) {
            Text(dismissButtonTitle)
                .foregroundStyle(Color.ijLabel)
                .bold()
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.ijLabel.opacity(0.1))
        }
        .mask(Capsule())
        .buttonStyle(.plain)
    }
}
