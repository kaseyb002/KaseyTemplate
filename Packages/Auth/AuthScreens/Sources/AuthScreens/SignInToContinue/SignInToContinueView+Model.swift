import AuthModel
import Extensions
import Foundation
import HTTP

extension SignInToContinueView {
    struct Model: Sendable {
        let context: SignInToContinueContext
        var hostAddress: HostAddress
        var showDebugMenu: Bool
        let isPresentedModally: Bool
        var signInError: SignInError? = nil
        
        struct SignInError: Equatable, Sendable {
            let message: String
        }
    }
}

extension SignInToContinueView.Model {
    var headerText: String {
        context.signInMessage
    }
    
    var showServerLabel: Bool {
        showDebugMenu
    }
    
    var serverName: String {
        hostAddress.displayName
    }
}
