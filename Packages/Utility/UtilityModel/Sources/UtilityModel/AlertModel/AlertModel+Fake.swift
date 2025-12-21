import UIKit

extension AlertModel {
    @MainActor
    public static func fake(
        title: String? = "Alert Title",
        message: String? = "This is a message for you.",
        actions: [UIAlertAction] = [
            .init(title: "Action 1", callback: {}),
            .init(title: "Action 2", style: .destructive, callback: {}),
            .init(title: "Action 3", style: .destructive, image: .init(systemName: "trash"), callback: {}),
            .init(title: "Action 4", image: .init(systemName: "play"), callback: {})
        ],
        includeCancel: Bool = true
    ) -> Self {
        .init(
            title: title,
            message: message,
            actions: actions,
            includeCancel: includeCancel
        )
    }
}
