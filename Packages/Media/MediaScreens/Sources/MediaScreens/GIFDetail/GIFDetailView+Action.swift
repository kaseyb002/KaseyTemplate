import Foundation

extension GIFDetailView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case closeTapped
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension GIFDetailView {
    func handle(action: GIFDetailView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: GIFDetailView.Action.UI) {
        switch action {
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
        }
    }
    
    private func handle(
        dataUpdateAction: GIFDetailView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
