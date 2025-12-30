import Colors
import CoreUI
import Foundation
import UtilityModel

public enum NavAction {
    case systemNotificationSettings
    case alert(AlertModel)
    case dismiss(completion: (() -> Void)? = nil)
    case imageDetail(imageSource: ImageSource)
    case pop
}
