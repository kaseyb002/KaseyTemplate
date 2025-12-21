import Foundation

extension LaunchAppView {
    struct Model: Equatable {
        var state: State = .idle
        
        enum State: Equatable {
            case idle
            case loading
            case launched
            case error
        }
    }
}
