import Foundation

public enum NavAction<AppRequiredData> {
    case launchApp(AppRequiredData)
    case getHelp
}
