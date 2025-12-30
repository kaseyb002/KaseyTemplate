import Extensions
import Foundation
@preconcurrency import UserNotifications

extension UNNotification {
    var categoryIdentifier: String {
        request.content.categoryIdentifier
    }
    
    var userInfo: [AnyHashable: Any] {
        request.content.userInfo
    }
    
    var additionalData: [String: Any]? {
        userInfo.pushNotificationAdditionalData
    }
    
    public func object<T>(
        _ type: T.Type,
        for key: AdditionalDataKey
    ) -> T? {
        additionalData?[key.rawValue] as? T
    }
    
    public func id<T: EntityID>(
        _ idType: T.Type,
        for key: AdditionalDataKey
    ) -> T? {
        guard let idString: String = object(String.self, for: key) else {
            return nil
        }
        return .init(rawValue: idString)
    }
}

private extension Dictionary where Key == AnyHashable, Value: Any {
    var pushNotificationAdditionalData: [String: Any]? {
        guard let additionalData = self["aps"] as? [String: Any] else {
            return nil
        }
        return additionalData
    }
}
