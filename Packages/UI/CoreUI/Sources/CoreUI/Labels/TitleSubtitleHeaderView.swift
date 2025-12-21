import SwiftUI

public struct TitleSubtitleHeaderView: View {
    private let title: String
    private let subtitle: String
    
    public var body: some View {
        VStack(spacing: 4) {
            titleLabel
            subtitleLabel
        }
    }
    
    public init(
        title: String,
        subtitle: String
    ) {
        self.title = title
        self.subtitle = subtitle
    }
}

// MARK: - Subviews
extension TitleSubtitleHeaderView {
    private var titleLabel: some View {
        Text(title)
            .bold()
    }
    
    private var subtitleLabel: some View {
        Text(subtitle)
            .font(.footnote)
    }
}
