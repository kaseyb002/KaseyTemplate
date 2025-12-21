import Logger
import StoreKit
import UIKit

extension Navigator {
    public func presentRateAppPrompt(
        on presentingViewController: UIViewController
    ) {
        guard let scene: UIWindowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            logIt(.error, "presentRateAppPrompt() failed failed to find scene: UIWindowScene.")
            return
        }
        AppStore.requestReview(in: scene)
    }
}
