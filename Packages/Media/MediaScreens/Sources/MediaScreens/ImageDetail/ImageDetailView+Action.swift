import Foundation

extension ImageDetailView {
    enum Action {
        case doneTapped
    }
}

// MARK: - Handle
extension ImageDetailView {
    func handle(action: ImageDetailView.Action) {
        switch action {
        case .doneTapped:
            deps.didSelectNavAction(.dismiss())
        }
    }
}
