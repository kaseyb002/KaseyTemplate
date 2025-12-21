import Foundation
import UtilityModel

extension OtherAppsView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case closeTapped
            case appTapped(OtherApp)
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension OtherAppsView {
    func handle(action: OtherAppsView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: OtherAppsView.Action.UI) {
        switch action {
        case .closeTapped:
            deps.didSelectNavAction(.dismiss)

        case .appTapped(let app):
            deps.didSelectNavAction(.website(app.appStoreURL))
        }
    }
    
    private func handle(
        dataUpdateAction: OtherAppsView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
