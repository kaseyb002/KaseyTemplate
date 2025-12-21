import CoreUI
import SwiftUI
import UtilityModel

struct OtherAppsView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        appListView
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    closeButtonIfNeeded
                }
            }
            .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension OtherAppsView {
    private var appListView: some View {
        List {
            Section {
                otherAppRows(otherApps: model.otherApps)
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    private func otherAppRows(otherApps: [OtherApp]) -> some View {
        ForEach(otherApps, id: \.id) { app in
            OtherAppRow(
                otherApp: app,
                handleEvent: { event in
                    switch event {
                    case .tapped:
                        handle(action: .ui(.appTapped(app)))
                    }
                }
            )
            .listRowBackground(Color.ijSecondaryBackground)
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
