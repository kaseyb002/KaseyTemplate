import Foundation
import UserModel

extension ChooseUsernameView {
    struct Model: Sendable {
        let navActionOnSuccess: NavAction
        let myUsername: String?
        var username: String
        var checkingValidityState: CheckingValidityState = .idle
        var submissionState: SubmissionState = .idle
        
        enum SubmissionState: Equatable, Sendable {
            case idle
            case submitting
        }
        
        enum CheckingValidityState: Equatable, Sendable {
            case idle
            case isSameAsCurrentUsername
            case checking
            case checked(ValidUsernameStatus)
        }
    }
}

// MARK: - Display Values
extension ChooseUsernameView.Model {
    var isSubmitButtonDisabled: Bool {
        switch checkingValidityState {
        case .idle,
             .isSameAsCurrentUsername,
             .checking,
             .checked(.empty),
             .checked(.usernameIsTaken),
             .checked(.containsInvalidCharacters),
             .checked(.tooLong),
             .checked(.tooShort),
             .checked(.otherError):
            true
            
        case .checked(.valid):
            false
        }
    }
    
    var isInputMyCurrentUsername: Bool {
        username == myUsername && username.isEmpty == false
    }
    
    var invalidUsernameExplanation: String? {
        switch checkingValidityState {
        case .checked(.usernameIsTaken):
            if username == myUsername {
                nil
            } else {
                "sorry, that's taken"
            }
            
        case .checked(.containsInvalidCharacters):
            "has invalid characters"
            
        case .checked(.tooLong):
            "too long"
            
        case .checked(.tooShort):
            "too short"
            
        case .checked(.otherError):
            "🤷 something went wrong"
            
        case .idle,
                .isSameAsCurrentUsername,
                .checking,
                .checked(.empty),
                .checked(.valid):
            nil
        }
    }
}
