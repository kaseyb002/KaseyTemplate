import SwiftUI

public struct ListNavigationButton<
        TitleView: View
    >: View {
    private let icon: Image
    private let iconColor: Color
    private let titleView: TitleView
    private let detail: String?
    private let isLoading: Bool
    private let didTap: () -> Void
    
    public var body: some View {
        Button(action: didTap) {
            HStack(spacing: 5) {
                HStack(spacing: 10) {
                    iconView
                    loadingSpinnerIfNeeded
                    titleView
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                detailLabelIfNeeded
                chevronIcon
            }
            .padding(.vertical, 1)
            .contentShape(Rectangle())
        }
        .listRowBackground(Color.ijSecondaryBackground)
        .opacity(isLoading ? 0.5 : 1)
        .disabled(isLoading)
    }
    
    public init(
        icon: Image,
        iconColor: Color,
        title: String,
        detail: String? = nil,
        isLoading: Bool = false,
        didTap: @escaping () -> Void
    ) where TitleView == Text {
        self.init(
            icon: icon,
            iconColor: iconColor,
            titleView: {
                Text(title)
                    .foregroundStyle(Color.ijLabel)
            },
            detail: detail,
            isLoading: isLoading,
            didTap: didTap
        )
    }
    
    public init(
        icon: Image,
        iconColor: Color,
        titleView: @escaping () -> TitleView,
        detail: String? = nil,
        isLoading: Bool = false,
        didTap: @escaping () -> Void
    ) {
        self.icon = icon
        self.iconColor = iconColor
        self.titleView = titleView()
        self.detail = detail
        self.isLoading = isLoading
        self.didTap = didTap
    }
}

// MARK: - Subviews
extension ListNavigationButton {
    private var iconView: some View {
        ListNavigationIconView(
            icon: icon,
            iconColor: iconColor
        )
    }
    
    @ViewBuilder
    private var loadingSpinnerIfNeeded: some View {
        if isLoading {
            LoadingSpinnerView()
        }
    }
    
    @ViewBuilder
    private var detailLabelIfNeeded: some View {
        if let detail: String {
            Text(detail)
                .foregroundStyle(Color.ijSecondaryLabel)
        }
    }
    
    private var chevronIcon: some View {
        Image(systemName: "chevron.right")
            .foregroundStyle(Color.ijTertiaryLabel)
            .font(.footnote)
    }
}

#Preview {
//    Form {
//        Section {
//            ListNavigationButton(
//                icon: Image(systemName: "photo"),
//                iconColor: .blue,
//                title: "Change group image",
//                didTap: {}
//            )
//        }
//    }
//    .scrollContentBackground(.hidden)
//    .background(Color.ijBackground)
    
    ScrollView {
        VStack {
            ListNavigationButton(
                icon: Image(systemName: "photo"),
                iconColor: .blue,
                title: "Change group image",
                didTap: {}
            )
            .padding()
            .background(
                Color.ijSecondaryBackground,
                in: RoundedRectangle(cornerRadius: 20)
            )
        }
        .padding()
    }
    .contentMargins(10)
    .scrollContentBackground(.hidden)
    .background(Color.ijBackground)
}
