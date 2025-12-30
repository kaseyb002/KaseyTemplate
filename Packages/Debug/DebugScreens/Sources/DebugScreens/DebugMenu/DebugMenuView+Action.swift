import Foundation

extension DebugMenuView {
    enum Action {
        case initiated
        case ui(UI)

        enum UI {
            case closeTapped
            case networkSettingsTapped
            case notificationsTapped
            case onboardingPromptsTapped
            case currentGamesTapped
            case groupPreviewTapped
            case signOutTapped
            case uiPlaygroundTapped
            case urlHandlerTapped
            case rateAppsTapped
            case updateAppTapped
        }
    }
}

// MARK: - Actions
extension DebugMenuView {
    func handle(action: DebugMenuView.Action) {
        switch action {
        case .initiated:
            setupSubscriptions()

        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: DebugMenuView.Action.UI) {
        switch action {
        case .closeTapped:
            didSelectNavAction(.dismiss())
            
        case .networkSettingsTapped:
            didSelectNavAction(.networkSettings)
            
        case .notificationsTapped:
            didSelectNavAction(.debugNotifications)
            
        case .onboardingPromptsTapped:
            didSelectNavAction(.onboardingPromptsDebug)
            
        case .signOutTapped:
            Task { [weak self] in
                guard let self else { return }
                try await dataStore.signOut()
            }
            
        case .uiPlaygroundTapped:
            didSelectNavAction(.uiPlayground)
            
        case .urlHandlerTapped:
            didSelectNavAction(.debugURLHandler(
                pushCount: 0,
                modalCount: 0,
                presentModal: false
            ))
            
        case .currentGamesTapped:
            didSelectNavAction(.currentGames)
            
        case .rateAppsTapped:
            didSelectNavAction(.debugRateApps)
            
        case .updateAppTapped:
            didSelectNavAction(.updateApp)
            
        case .tablePreviewTapped:
            didSelectNavAction(.tablePreview)
        }
    }
}
