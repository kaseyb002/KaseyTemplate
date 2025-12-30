import UIKit

@MainActor
public struct Navigator {
    let deps: Deps
    let didSelectNavAction: (NavAction, UINavigationController) -> Void
    
    public init(
        deps: Deps,
        didSelectNavAction: @escaping (NavAction, UINavigationController) -> Void
    ) {
        self.deps = deps
        self.didSelectNavAction = didSelectNavAction
    }
}
