import Foundation

extension LaunchAppView {
    enum Action {
        case initialized
        case ui(UI)
        
        enum UI {
            case error(LaunchAppErrorView.Action)
        }
    }
}

extension LaunchAppView {
    func handle(action: LaunchAppView.Action) {
        switch action {
        case .initialized:
            launchAppIfNeeded()
            
        case .ui(let action):
            handle(ui: action)
        }
    }
    
    private func handle(ui action: Action.UI) {
        switch action {
        case .error(let action):
            handle(error: action)
        }
    }
    
    private func handle(error action: LaunchAppErrorView.Action) {
        switch action {
        case .getHelpTapped:
            handleNavAction(.getHelp)
        }
    }

    private func launchAppIfNeeded() {
        guard model.state == .idle else {
            return
        }
        
        model.state = .loading
        
        Task {
            do {
                try await dataStore.setupPreAppLaunch()
                
                let appRequiredData: AppRequiredData = try await dataStore.appRequiredData()

                await MainActor.run {
                    handleNavAction(.launchApp(appRequiredData))
                }
                
                model.state = .launched
            } catch {
                model.state = .error
                assertionFailure(error.localizedDescription)
            }
            
            do {
                try await dataStore.setupPostAppLaunch()
            } catch {
                assertionFailure(error.localizedDescription)
            }
        }
    }
}
