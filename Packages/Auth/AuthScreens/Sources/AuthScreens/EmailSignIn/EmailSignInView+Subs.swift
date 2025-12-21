import Combine
import Foundation

extension EmailSignInView {
    func subscribeToUpdates() async -> Set<AnyCancellable> {
        [
            formChanged
                .removeDuplicates()
                .debounce(for: .seconds(0.2), scheduler: RunLoop.main)
                .sink { form in
                    handle(action: .ui(.formChanged(form)))
                },
        ]
    }
}
