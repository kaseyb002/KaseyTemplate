import Foundation
import UtilityModel

public enum NavAction {
    case alert(AlertModel)
    case actionSheet(ActionSheetModel)
    case dismiss(completion: (@MainActor () -> Void)? = nil)
    case pop
    case website(URL)
}
