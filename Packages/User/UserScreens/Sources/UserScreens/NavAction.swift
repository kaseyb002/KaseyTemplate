import Colors
import CoreUI
import Foundation
import MediaModel
import UtilityModel

public enum NavAction: Sendable {
    case alert(AlertModel)
    case appSystemNotificationSettings
    case appSystemSettings
    case chooseUsername
    case debugMenu
    case deleteAccount
    case dismiss(completion: (@MainActor @Sendable () -> Void)? = nil)
    case learnPoker
    case imageDetail(imageSource: ImageSource)
    case imagePicker(ImagePickerRequiredData)
    case pop
    case sendFeedback
    case otherApps
    case mainTab
    case rateApp
}
