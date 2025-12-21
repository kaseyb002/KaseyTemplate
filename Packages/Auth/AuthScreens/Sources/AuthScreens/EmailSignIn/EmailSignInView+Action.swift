import Foundation
import AuthModel
import Extensions

extension EmailSignInView {
    enum Action {
        case ui(UI)
        
        enum UI {
            case viewDidLoad
            case createAccountTapped
            case formChanged(EmailSignInView.Model.Form)
            case signInTapped
            case getHelpTapped
            case passwordVisibleToggled
        }
    }
}

// MARK: - Handle
extension EmailSignInView {
    func handle(action: EmailSignInView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
        }
    }
    
    private func handle(ui action: EmailSignInView.Action.UI) {
        switch action {
        case .viewDidLoad:
            validate(form: model.form)

        case .createAccountTapped:
            createAccount()

        case .formChanged(let form):
            validate(form: form)
            
        case .signInTapped:
            signIn()
        
        case .getHelpTapped:
            deps.didSelectNavAction(.getHelp)
            
        case .passwordVisibleToggled:
            model.isPasswordVisible.toggle()
        }
    }
    
    private func validate(form: EmailSignInView.Model.Form) {
        guard form.username.isEmpty == false,
              form.password.isEmpty == false
        else {
            model.state = .incompleteForm
            return
        }
        
        model.state = .formComplete
    }
    
    private func createAccount() {
        model.state = .creatingAccount
        Task {
            do {
                let tokenResponse: TokenResponse = try await deps.dataStore.createAccount(
                    email: model.form.username,
                    password: model.form.password
                )
                await MainActor.run {
                    signedIn(tokenResponse: tokenResponse)
                }
            } catch {
                await MainActor.run {
                    display(error: error)
                }
            }
        }
    }
    
    private func signIn() {
        model.state = .signingIn
        Task {
            let signInMethod: SignInMethod = .email(
                username: model.form.username,
                password: model.form.password
            )
            do {
                let tokenResponse: TokenResponse = try await deps.dataStore.signIn(method: signInMethod)
                await MainActor.run {
                    signedIn(tokenResponse: tokenResponse)
                }
            } catch let error {
                await MainActor.run {
                    display(error: error)
                }
            }
        }
    }
    
    private func signedIn(tokenResponse: TokenResponse) {
        let signedInResult: SignedInResult = .init(
            isNewAccount: tokenResponse.isNewAccount
        )
        deps.didSelectNavAction(.dismiss(completion: { model.completion(signedInResult) }))
    }
    
    private func display(error: Error) {
        if let error = error as? DisplayableError {
            model.state = .error(message: error.displayableErrorTitle + (error.displayableErrorMessage ?? ""))
        } else {
            model.state = .error(message: error.localizedDescription)
        }
    }
}
