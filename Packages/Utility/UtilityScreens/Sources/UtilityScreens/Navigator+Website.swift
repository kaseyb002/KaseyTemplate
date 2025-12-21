import SafariServices
import SwiftUI

extension Navigator {
    public func presentWebsite(
        url: URL,
        on presentingViewController: UIViewController
    ) {
        let viewController: SFSafariViewController = .init(url: url)
        presentingViewController.present(viewController, animated: true)
    }
}
