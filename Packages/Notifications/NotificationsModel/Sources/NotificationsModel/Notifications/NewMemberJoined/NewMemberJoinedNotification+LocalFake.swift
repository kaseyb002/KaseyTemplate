import Foundation
@preconcurrency import UserNotifications

extension NewMemberJoinedNotification {
    public static func localFake() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "turner joined the group"
        content.subtitle = "The New Group"
        content.body = "Give them a welcome."
        content.sound = .default
        content.categoryIdentifier = "NEW_MEMBER_JOINED"
        content.threadIdentifier = "group_5aa774d7-b93a-49fe-850c-9af3f348aaff"
        content.userInfo = [
            "group_id": "26117e44-1cf7-440d-823c-083ffa8b6af5",
            "user_id": "3",
        ]
        return content
    }
}
