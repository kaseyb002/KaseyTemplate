import Foundation
import UserModel

extension DeleteAccountView {
    struct Model: Sendable {
        let isPresentedModally: Bool
        let myUsername: String
        var typedInUsername: String = ""
        var submissionState: SubmissionState = .idle
        
        enum SubmissionState: Equatable {
            case idle
            case submitting
            case deleted
        }
    }
}

extension DeleteAccountView.Model {
    var isDeleteButtonDisabled: Bool {
        typedInUsername != myUsername || typedInUsername.isEmpty
    }
    
    var isUsernameCorrect: Bool {
        typedInUsername == myUsername && typedInUsername.isEmpty == false
    }
}
