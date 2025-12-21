import Foundation
import Combine
import SwiftUI

extension TabSwitcher {
    public final class Controller: ObservableObject {
        @Published public var screens: Array<Screen>
        @Published public var selectedScreen: Screen?
        private var subscriptions: Set<AnyCancellable> = []

        public init(
            screens: Array<Screen> = []
        ) {
            self.screens = screens

            setupSubscriptions()
        }
    }
}

// MARK: - Actions
extension TabSwitcher.Controller {

     
}

// MARK: - Subscriptions
extension TabSwitcher.Controller {
    private func setupSubscriptions() {

    }
}


// MARK: - Helper Models
extension TabSwitcher.Controller {
    public struct Screen: Equatable {
        public let id: String
        public let view: AnyView

        public init(id: String, view: AnyView) {
            self.id = id
            self.view = view
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.id == rhs.id
        }
    }
}
