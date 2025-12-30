import Colors
import CoreUI
import SwiftUI

struct DebugURLHandlerView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Form {
            Section {
                pushButton
                presentModalButton
            }
            
            Section("Push Notifications") {
                pushActionButtons
            }
            
            Section("URLs") {
                urlButtons
            }
        }
        .scrollContentBackground(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButtonIfNeeded
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension DebugURLHandlerView {
    private var pushButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "arrow.forward"),
            iconColor: .blue,
            title: "Push another",
            detail: "Count: \(model.pushCount)",
            didTap: {
                handle(action: .ui(.pushTapped))
            }
        )
    }
    
    private var presentModalButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "arrow.up"),
            iconColor: .blue,
            title: "Present another modal",
            detail: "Count: \(model.modalCount)",
            didTap: {
                handle(action: .ui(.presentModalTapped))
            }
        )
    }
    
    private var urlButtons: some View {
        ForEach(model.urls) { urlDestination in
            URLDestinationButton(
                urlDestination: urlDestination,
                handleAction: { handle(action: .ui(.urlButton($0, url: urlDestination))) }
            )
        }
    }
    
    private var pushActionButtons: some View {
        ForEach(model.pushNotificationAppActions, id: \.logDescription) { pushAction in
            PushNotificationAppActionButton(
                pushNotificationAppAction: pushAction,
                tapped: { handle(action: .ui(.pushActionTapped(pushAction))) }
            )
        }
    }
    
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
}
