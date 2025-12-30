import Foundation
import UtilityModel

extension DeleteAccountView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case closeTapped
            case usernameTextChanged(String)
            case deleteAccountTapped
            case deleteAccountConfirmed
        }
        
        enum DataUpdate {
            case stub
        }
    }
}

extension DeleteAccountView {
    func handle(action: DeleteAccountView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: DeleteAccountView.Action.UI) {
        switch action {
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
            
        case .usernameTextChanged(let typedInUsername):
            model.typedInUsername = typedInUsername
            
        case .deleteAccountConfirmed:
            model.submissionState = .submitting
            Task {
                do {
                    try await Task.sleep(for: .seconds(3)) // makes it feel more official
                    try await deps.dataStore.deleteAccount()
                    await MainActor.run {
                        model.submissionState = .deleted
                        if model.isPresentedModally {
                            deps.didSelectNavAction(.dismiss())
                        } else {
                            deps.didSelectNavAction(.pop)
                        }
                    }
                } catch {
                    let errorAlert: AlertModel = .errorAlert(error)
                    await MainActor.run {
                        deps.didSelectNavAction(.alert(errorAlert))
                        model.submissionState = .idle
                    }
                }
            }
            
        case .deleteAccountTapped:
            let alert: AlertModel = .init(
                title: "Final Warning",
                message: "Tapping delete will irrevocably delete your account.",
                actions: [
                    .init(title: "Delete account", style: .destructive) {
                        handle(action: .ui(.deleteAccountConfirmed))
                    }
                ]
            )
            deps.didSelectNavAction(.alert(alert))
        }
    }
    
    private func handle(
        dataUpdateAction: DeleteAccountView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .stub:
            break
        }
    }
}
