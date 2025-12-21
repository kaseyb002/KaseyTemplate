import Combine
import SwiftUI

extension View {
    public func subscribeToUpdates(
        _ makeSubscriptions: @escaping () async -> Set<AnyCancellable>
    ) -> some View {
        modifier(ViewSubscriptionsModifier(makeSubscriptions: makeSubscriptions))
    }
}

private struct ViewSubscriptionsModifier: ViewModifier {
    @State private var subscriptions: Set<AnyCancellable> = []
    let makeSubscriptions: () async -> Set<AnyCancellable>

    func body(content: Content) -> some View {
        content
            .onViewDidLoad {
                subscriptions.removeAll()
                Task {
                    subscriptions = await makeSubscriptions()
                }
            }
    }
}
