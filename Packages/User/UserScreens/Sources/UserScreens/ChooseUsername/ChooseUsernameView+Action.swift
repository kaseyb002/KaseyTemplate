import Foundation
import UserModel

extension ChooseUsernameView {
    enum Action {
        case ui(UI)

        enum UI {
            case usernameTextChanged(String)
            case userTypingStoppedForAMoment
            case submitTapped
            case clearUsernameTapped
        }
    }
}

// MARK: - Handle
extension ChooseUsernameView {
    func handle(action: ChooseUsernameView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
        }
    }

    private func handle(ui action: ChooseUsernameView.Action.UI) {
        switch action {
        case .usernameTextChanged(let username):
            model.username = username
            typeInUsernameDebouncer.send()
            
        case .userTypingStoppedForAMoment:
            validate(username: model.username)
            
        case .submitTapped:
            model.submissionState = .submitting
            let username: String = model.username
            Task {
                _ = try await deps.dataStore.update(username: username)
                await MainActor.run {
                    deps.didSelectNavAction(model.navActionOnSuccess)
                }
            }
            
        case .clearUsernameTapped:
            model.username.removeAll()
            typeInUsernameDebouncer.send()
        }
    }

    private func validate(username: String) {
        guard model.isInputMyCurrentUsername == false else {
            model.checkingValidityState = .isSameAsCurrentUsername
            return
        }
        
        model.checkingValidityState = .checking
        checkingValidityTask?.cancel()
        checkingValidityTask = Task {
            let validStatus: ValidUsernameStatus = try await deps.dataStore.validate(username: username)
            await MainActor.run {
                model.checkingValidityState = .checked(validStatus)
            }
        }
    }
}
