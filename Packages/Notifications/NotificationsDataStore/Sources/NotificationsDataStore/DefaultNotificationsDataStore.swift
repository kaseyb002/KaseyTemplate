import Combine
import Foundation
import FirebaseCore
import FirebaseMessaging
import GroupModel
import Logger
import NotificationsClient
import NotificationsModel
@preconcurrency import UserNotifications

public final class DefaultNotificationsDataStore: NSObject, NotificationsDataStore, @unchecked Sendable {
    private let client: NotificationsClient
    private var subscriptions: Set<AnyCancellable> = []
    public var blockNotification: (UNNotification) -> Bool = { _ in false }
    public let didReceivePushNotificationAppAction: PassthroughSubject<PushNotificationAppAction, Never> = .init()
    public let didUpdateNotificationsAuthorizationStatus: PassthroughSubject<UNNotificationSettings, Never> = .init()

    public init(
        client: NotificationsClient
    ) {
        self.client = client
    }
    
    public func setup() async throws {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self

        setupSubscriptions()
        registerNotificationCategories()
        try await registerForRemoteNotificationsIfAuthorizationHasBeenGranted()
    }
    
    public func notificationSettings() async throws -> UNNotificationSettings {
        await UNUserNotificationCenter.current().notificationSettings()
    }
    
    public func requestNotificationPermission() async throws {
        let granted: Bool = try await UNUserNotificationCenter.current().requestAuthorization(
            options: [
                .alert,
                .badge,
                .sound,
            ]
        )
        if granted {
            registerForRemoteNotifications()
        } else {
            logIt(.info, "Notifications permission not granted.")
        }
        let settings: UNNotificationSettings = try await notificationSettings()
        didUpdateNotificationsAuthorizationStatus.send(settings)
    }
    
    public func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws {
        guard try await notificationSettings().shouldPromptForAccess == false else {
            return
        }
        registerForRemoteNotifications()
    }
    
    private func registerForRemoteNotifications() {
        NotificationCenter.default.post(
            name: .registerForRemoteNotifications,
            object: self
        )
    }
    
    public func setDevice(token: Data) {
        Messaging.messaging().apnsToken = token
    }
    
    public func registerNotificationCategories() {
        let notifications: [PushNotification] = PushNotificationCategoryID.allCases.map(pushNotification)
        let categories: Set<UNNotificationCategory> = Set(notifications.map { $0.category })
        UNUserNotificationCenter.current().setNotificationCategories(categories)
    }
    
    public func groupNotificationSettings(
        groupID: GroupID
    ) async throws -> GroupNotificationSettings {
        try await client.groupNotificationSettings(
            groupID: groupID
        )
    }
    
    public func editGroupNotificationSettings(
        form: EditGroupNotificationSettingsForm
    ) async throws -> GroupNotificationSettings {
        try await client.editGroupNotificationSettings(
            form: form
        )
    }
    
    private func register(pushID: String) async throws {
        try await client.register(pushID: pushID)
    }
    
    public func deletePushRegistration() async throws {
        guard let fcmToken: String = Messaging.messaging().fcmToken else {
            return
        }
        try await client.deletePushRegistration(pushID: fcmToken)
    }
}

extension DefaultNotificationsDataStore: MessagingDelegate {
    public func messaging(
        _ messaging: Messaging,
        didReceiveRegistrationToken fcmToken: String?
    ) {
        guard let fcmToken: String else {
            return
        }
        Task { [weak self] in
            guard let self else { return }
            do {
                try await register(pushID: fcmToken)
            } catch {
                logIt(.error, "Push registration failed", error: error)
            }
        }
    }
}

extension DefaultNotificationsDataStore: UNUserNotificationCenterDelegate {
    // MARK: - Notification Presentation
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping @Sendable (UNNotificationPresentationOptions) -> Void
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let self,
                  blockNotification(notification) == false
            else {
                completionHandler([])
                return
            }
            completionHandler(
                [
                    .banner,
                    .list,
                    .sound,
                ]
            )
        }
    }
    
    // MARK: - Response Handling
    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        guard let action: PushNotificationAppAction = action(for: response) ?? defaultAction(for: response) else {
            return
        }
        didReceivePushNotificationAppAction.send(action)
    }
    
    private func defaultAction(
        for response: UNNotificationResponse
    ) -> PushNotificationAppAction? {
        guard let categoryID: PushNotificationCategoryID = .init(rawValue: response.notification.request.content.categoryIdentifier) else {
            return nil
        }
        let pushNotification: PushNotification = pushNotification(
            categoryID: categoryID
        )
        return pushNotification.defaultAction.action(for: response)
    }
    
    private func action(
        for response: UNNotificationResponse
    ) -> PushNotificationAppAction? {
        guard let responseActionID: PushNotificationUserResponseActionID = .init(rawValue: response.actionIdentifier) else {
            return nil
        }
        switch responseActionID {
        case .viewGroup:
            return ViewGroupAction().action(for: response)
            
        case .viewGroups:
            return ViewGroupsAction().action(for: response)

        case .viewGroupMember:
            return ViewGroupMemberAction().action(for: response)
        }
    }
    
    private func pushNotification(
        categoryID: PushNotificationCategoryID
    ) -> any PushNotification {
        switch categoryID {
        case .newMemberJoined: NewMemberJoinedNotification()
        }
    }
}

// MARK: - Subscriptions
extension DefaultNotificationsDataStore {
    private func setupSubscriptions() {
        NotificationCenter.default.publisher(for: .didRegisterForRemoteNotificationsWithDeviceToken)
            .sink { [weak self] notification in
                guard let self,
                      let userInfo: [AnyHashable: Any] = notification.userInfo,
                      let deviceToken: Data = userInfo["deviceToken"] as? Data
                else {
                    return
                }
                setDevice(token: deviceToken)
            }
            .store(in: &subscriptions)
    }
}
