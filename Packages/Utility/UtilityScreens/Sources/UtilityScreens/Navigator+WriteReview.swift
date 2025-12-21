import UtilityModel
import SwiftUI

extension Navigator {
    public func presentWriteReview(
        app: OtherApp,
        on presentingViewController: UIViewController
    ) {
        UIApplication.shared.open(app.writeReviewURL)
    }
}
