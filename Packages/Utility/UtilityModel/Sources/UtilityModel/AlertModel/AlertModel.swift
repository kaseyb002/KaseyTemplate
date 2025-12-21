import UIKit

// MARK: - Models
public struct AlertModel: Sendable {
    public let title: String?
    public let message: String?
    public let actions: [UIAlertAction]
    public let includeCancel: Bool
    
    public init(
        title: String?,
        message: String? = nil,
        actions: [UIAlertAction],
        includeCancel: Bool = true
    ) {
        self.title = title
        self.message = message
        self.actions = actions
        self.includeCancel = includeCancel
    }
}
