import SwiftUI

/// Presents a Launch View to give you an opportunity to do any required async setup before launching the app.
@MainActor
public func presentLaunchApp<AppRequiredData>(
    dataStore: any DataStore<AppRequiredData>,
    handleNavAction: @escaping (NavAction<AppRequiredData>) -> Void,
    in navigationController: UINavigationController,
    @ViewBuilder content: () -> some View = { Color.clear },
) {
    let view: LaunchAppView = .init(
        dataStore: dataStore,
        handleNavAction: handleNavAction,
        content: content,
    )
    let hostingController: UIHostingController = .init(
        rootView: view
    )
    navigationController.setViewControllers([hostingController], animated: false)
}
