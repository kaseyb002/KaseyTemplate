import Foundation

extension AuthError {
    public static func fake() -> AuthError {
        .notSignedIn
    }
}
