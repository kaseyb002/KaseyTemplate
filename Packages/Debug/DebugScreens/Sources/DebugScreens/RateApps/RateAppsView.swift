import Colors
import CoreUI
import SwiftUI
import UtilityModel

struct RateAppsView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Form {
            Section {
                ForEach([OtherApp].all, id: \.id) { otherApp in
                    ListNavigationButton(
                        icon: Image(systemName: "star.fill"),
                        iconColor: .orange,
                        title: otherApp.displayName,
                        didTap: { handle(action: .ui(.rateAppTapped(otherApp: otherApp))) }
                    )
                }
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
extension RateAppsView {
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
}
