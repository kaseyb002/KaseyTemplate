import Foundation

public enum AuthError: Error {
    case notSignedIn
    case emptyURL
    
    public enum CreateAccount: Error {
        case missingEmail
        case missingPassword
        case invalidPassword
        case authTypeNotSupported
    }
    
    public enum SignIn: Error {
        case noAccountWithThatEmail
        case wrongPassword
        case authTypeNotSupported
    }
}
