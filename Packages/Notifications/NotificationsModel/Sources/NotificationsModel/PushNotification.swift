import Foundation
@preconcurrency import UserNotifications

public protocol PushNotification {
    var categoryID: PushNotificationCategoryID { get }
    var defaultAction: any PushNotificationUserResponseAction { get }
    var additionalActions: [any PushNotificationUserResponseAction] { get }
    var hiddenPreviewsBodyPlaceholder: String { get }
    var categorySummaryFormat: String { get }
}
