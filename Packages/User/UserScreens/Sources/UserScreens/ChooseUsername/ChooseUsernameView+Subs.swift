import Combine
import Foundation

extension ChooseUsernameView {
    func subscribeToUpdates() async -> Set<AnyCancellable> {
        [
            typeInUsernameDebouncer
                .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
                .receive(on: DispatchQueue.main)
                .sink { username in
                    handle(action: .ui(.userTypingStoppedForAMoment))
                }
        ]
    }
}
