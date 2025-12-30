import NotificationsModel
import Colors
import CoreUI
import UIKit

extension DebugURLHandlerView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case presentModalTapped
            case pushTapped
            case urlButton(URLDestinationButton.Action, url: Model.URLDestination)
            case pushActionTapped(PushNotificationAppAction)
            case closeTapped
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension DebugURLHandlerView {
    func handle(action: DebugURLHandlerView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: DebugURLHandlerView.Action.UI) {
        switch action {
        case .presentModalTapped:
            deps.didSelectNavAction(.debugURLHandler(
                pushCount: model.pushCount,
                modalCount: model.modalCount,
                presentModal: true
            ))
            
        case .pushTapped:
            deps.didSelectNavAction(.debugURLHandler(
                pushCount: model.pushCount,
                modalCount: model.modalCount,
                presentModal: false
            ))
            
        case .urlButton(let action, let url):
            handle(urlDestinationButton: action, urlDestination: url)

        case .pushActionTapped(let pushAction):
            deps.didSelectNavAction(.pushActionTestHandler(pushAction))
            
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
        }
    }
    
    private func handle(
        urlDestinationButton action: URLDestinationButton.Action,
        urlDestination: Model.URLDestination
    ) {
        switch action {
        case .tapped:
            deps.didSelectNavAction(.urlTestHandler(url: urlDestination.url))

        case .copyToClipboardTapped:
            UIPasteboard.general.string = urlDestination.url.absoluteString
            showHUD(
                UIImage(systemName: "doc.on.doc"),
                title: "URL copied to clipboard"
            )
        }
    }
    
    private func handle(
        dataUpdateAction: DebugURLHandlerView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
