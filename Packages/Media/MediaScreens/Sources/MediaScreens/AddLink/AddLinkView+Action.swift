import Foundation

extension AddLinkView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case saveTapped(URL)
            case closeTapped
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension AddLinkView {
    func handle(action: AddLinkView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: AddLinkView.Action.UI) {
        switch action {
        case .saveTapped(let url):
            model.didAddLink(url)
            close()
            
        case .closeTapped:
            close()
        }
    }
    
    private func close() {
        if model.isPresentedModally {
            deps.didSelectNavAction(.dismiss())
        } else {
            deps.didSelectNavAction(.pop)
        }
    }
    
    private func handle(
        dataUpdateAction: AddLinkView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
