import Foundation
import UtilityModel

extension RateAppsView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case rateAppTapped(otherApp: OtherApp)
            case closeTapped
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension RateAppsView {
    func handle(action: RateAppsView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: RateAppsView.Action.UI) {
        switch action {
        case .rateAppTapped(let otherApp):
            deps.didSelectNavAction(.rateApp(otherApp))
            
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
        }
    }
    
    private func handle(
        dataUpdateAction: RateAppsView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
