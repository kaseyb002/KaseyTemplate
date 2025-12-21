import Foundation
import AuthModel

extension EmailSignInView {
    struct Model: Sendable {
        var form: Form = .init()
        var state: State = .incompleteForm
        var isPasswordVisible: Bool = false
        let completion: @MainActor @Sendable (SignedInResult) -> Void

        enum State: Equatable {
            case incompleteForm
            case formComplete
            case creatingAccount
            case signingIn
            case error(message: String)
            case signedIn
        }
        
        enum FormError: Equatable {
            
        }
        
        struct Form: Equatable {
            var username: String = ""
            var password: String = ""
        }
    }
}

// MARK: - Display Values
extension EmailSignInView.Model {
    var loadingText: String {
        switch state {
        case .creatingAccount:
            return "Creating account"
        case .signingIn:
            return "Signing in"
        default:
            return ""
        }
    }
    
    var isSignInButtonDisabled: Bool {
        switch state {
        case .error, .formComplete:
            return false
        case .incompleteForm, .signedIn, .signingIn, .creatingAccount:
            return true
        }
    }
    
    var isCreateAccountButtonDisabled: Bool {
        switch state {
        case .error, .formComplete:
            return false
        case .incompleteForm, .signedIn, .signingIn, .creatingAccount:
            return true
        }
    }
}
