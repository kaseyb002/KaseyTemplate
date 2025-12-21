@preconcurrency import Combine
import Foundation

extension SignInToContinueView {
    func subscribeToUpdates() async -> Set<AnyCancellable> {
        await [
            deps.dataStore.didUpdateHostAddress
                .receive(on: DispatchQueue.main)
                .sink { hostAddress in
                    handle(action: .dataUpdate(.hostAddressUpdated(hostAddress)))
                },
        ]
    }
}
