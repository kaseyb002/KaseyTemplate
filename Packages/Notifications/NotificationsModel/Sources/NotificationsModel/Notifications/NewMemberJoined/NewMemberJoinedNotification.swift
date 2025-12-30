import Foundation
@preconcurrency import UserNotifications

public struct NewMemberJoinedNotification: PushNotification, Sendable {
    public let categoryID: PushNotificationCategoryID = .newMemberJoined
    public let defaultAction: any PushNotificationUserResponseAction = ViewGroupMemberAction()
    public let additionalActions: [any PushNotificationUserResponseAction] = [
        ViewGroupMemberAction(),
    ]
    public let hiddenPreviewsBodyPlaceholder: String = "Group update"
    public let categorySummaryFormat: String = "Group updates"
    
    public init() {
        
    }
}
