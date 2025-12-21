import UIKit

// MARK: - Models
public struct ActionSheetModel: Sendable {
    public let title: String?
    public let message: String?
    public let sourceView: UIView
    public let actions: [UIAlertAction]
    
    public init(
        title: String?,
        message: String? = nil,
        sourceView: UIView,
        actions: [UIAlertAction]
    ) {
        self.title = title
        self.message = message
        self.sourceView = sourceView
        self.actions = actions
    }
}
