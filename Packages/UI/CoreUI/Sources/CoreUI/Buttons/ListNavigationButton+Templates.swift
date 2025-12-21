import SwiftUI

extension ListNavigationButton<Text> {
    public static func rateAppButton(
        didTap: @escaping () -> Void
    ) -> some View {
        ListNavigationButton<Text>(
            icon: Image(systemName: "star.fill"),
            iconColor: .orange,
            title: "Rate the app",
            didTap: didTap
        )
    }
}
