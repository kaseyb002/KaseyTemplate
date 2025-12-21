import SwiftUI

struct LaunchAppView<AppRequiredData, Content: View>: View {
    @State var model: Model = .init()
    let dataStore: any DataStore<AppRequiredData>
    let handleNavAction: (NavAction<AppRequiredData>) -> Void
    let content: Content

    var body: some View {
        switch model.state {
        case .idle, .loading, .launched:
            content

        case .error:
            errorView
        }
    }
    
    init(
        dataStore: any DataStore<AppRequiredData>,
        handleNavAction: @escaping (NavAction<AppRequiredData>) -> Void,
        @ViewBuilder content: () -> Content,
    ) {
        self.dataStore = dataStore
        self.handleNavAction = handleNavAction
        self.content = content()
        
        handle(action: .initialized)
    }
}

// MARK: - Subviews
extension LaunchAppView {
    private var errorView: some View {
        LaunchAppErrorView(handleAction: { handle(action: .ui(.error($0))) })
    }
}
