import SwiftUI

public struct TabSwitcher: UIViewControllerRepresentable {
    private let controller: Controller

    public init(controller: Controller) {
        self.controller = controller
    }

    public func makeUIViewController(context: Context) -> UITabSwitcher {
        .init(
            controller: controller,
            didDisplayScreen: { screen in
                controller.selectedScreen = screen
            }
        )
    }

    public func updateUIViewController(
        _ uiViewController: UITabSwitcher,
        context: Context
    ) {
        // noop
    }
}
