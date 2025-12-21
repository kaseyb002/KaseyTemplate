import AuthModel
import Extensions
import Foundation
import HTTP

extension SignInToContinueView {
    enum Action {
        case ui(UI)
        case dataUpdate(DataUpdate)

        enum UI {
            case signUpViaEmailTapped
            case signInViaGoogleTapped
            case signInViaAppleTapped
            case getHelpTapped
            case serverTapped
            case closeTapped
        }
        
        enum DataUpdate {
            case hostAddressUpdated(HostAddress)
            case showDebugMenuUpdated(Bool)
        }
    }
}

extension SignInToContinueView {
    func handle(action: SignInToContinueView.Action) {
        switch action {
        case .ui(let action):
            handle(ui: action)
            
        case .dataUpdate(let action):
            handle(dataUpdateAction: action)
        }
    }

    private func handle(ui action: SignInToContinueView.Action.UI) {
        switch action {
        case .signInViaGoogleTapped:
            model.signInError = nil
            deps.didSelectNavAction(.googleSignIn(handleToken: { result in
                switch result {
                case .success(let token):
                    signIn(method: .google(token: token))
                    
                case .failure(let error):
                    display(error: error)
                }
            }))

        case .signInViaAppleTapped:
            model.signInError = nil
            deps.appleSignInController.signIntoApple { result in
                switch result {
                case .success(let tokens):
                    signIn(
                        method: .apple(
                            idToken: tokens.idToken,
                            accessToken: tokens.accessToken,
                            name: tokens.fullName,
                        )
                    )
                    
                case .failure(let error):
                    display(error: error)
                }
            }
            
        case .signUpViaEmailTapped:
            model.signInError = nil
            deps.didSelectNavAction(.emailSignIn(completion: model.context.onSignInComplete))
            
        case .getHelpTapped:
            deps.didSelectNavAction(.getHelp)

        case .serverTapped:
            deps.didSelectNavAction(.debugMenu)
            
        case .closeTapped:
            deps.didSelectNavAction(.dismiss())
        }
    }
    
    private func handle(
        dataUpdateAction: SignInToContinueView.Action.DataUpdate
    ) {
        switch dataUpdateAction {
        case .hostAddressUpdated(let hostAddress):
            model.hostAddress = hostAddress
            
        case .showDebugMenuUpdated(let showDebugMenu):
            model.showDebugMenu = showDebugMenu
        }
    }
    
    private func display(error: Error) {
        if let error = error as? DisplayableError {
            model.signInError = .init(message: error.displayableErrorMessage ?? error.displayableErrorTitle)
        } else {
            model.signInError = .init(message: error.localizedDescription)
        }
    }
    
    private func signIn(method: SignInMethod) {
        let dataStore: SignInToContinueViewDataStore = deps.dataStore
        Task { [dataStore] in
            do {
                let tokenResponse: TokenResponse = try await dataStore.signIn(method: method)
                let result: SignedInResult = .init(
                    isNewAccount: tokenResponse.isNewAccount,
                )
                await MainActor.run {
                    deps.didSelectNavAction(.dismiss(completion: {
                        deps.didSelectNavAction(.signedIn(result))
                    }))
                }
            } catch {
                await MainActor.run {
                    display(error: error)
                }
            }
        }
    }
}
