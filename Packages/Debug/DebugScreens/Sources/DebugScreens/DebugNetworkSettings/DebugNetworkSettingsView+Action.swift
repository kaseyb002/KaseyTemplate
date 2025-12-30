import Foundation
import DebugModel

extension DebugNetworkSettingsView {
    enum Action {
        case initiated
        case ui(UI)

        enum UI {
            case serverEnvironmentSelected(DebugConfig.ServerEnvironment)
            case showSocketConnectionStatusToggled(isOn: Bool)
        }
    }
}
