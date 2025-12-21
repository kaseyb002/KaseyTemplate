import UIKit

@MainActor
public struct Navigator {
    let deps: Deps
    let didSelectNavAction: (NavAction, UINavigationController) -> Void
    let imagePickerDelegate: ImagePickerDelegate
    let giphyDelegate: DefaultGiphyDelegate
    
    public init(
        deps: Deps,
        didSelectNavAction: @escaping (NavAction, UINavigationController) -> Void
    ) {
        self.deps = deps
        self.didSelectNavAction = didSelectNavAction
        self.imagePickerDelegate = ImagePickerDelegate()
        self.giphyDelegate = DefaultGiphyDelegate()
    }
}
