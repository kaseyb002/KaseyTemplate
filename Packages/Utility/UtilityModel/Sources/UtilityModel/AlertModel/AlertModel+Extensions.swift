import Extensions
import UIKit

extension AlertModel {
    @MainActor
    public static func okAlert(
        title: String?,
        message: String? = nil
    ) -> Self {
        .init(
            title: title,
            message: message,
            actions: [
                .init(title: "OK", style: .default)
            ],
            includeCancel: false
        )
    }
    
    @MainActor
    public static func errorAlert(
        _ error: Error
    ) -> Self {
        let title: String
        let message: String?
        if let error = error as? DisplayableError {
            title = error.displayableErrorTitle
            message = error.displayableErrorMessage
        } else {
            title = "Something went wrong"
            message = error.localizedDescription
        }
        return .init(
            title: title,
            message: message,
            actions: [
                .init(title: "OK", style: .default),
            ],
            includeCancel: false
        )
    }
}
