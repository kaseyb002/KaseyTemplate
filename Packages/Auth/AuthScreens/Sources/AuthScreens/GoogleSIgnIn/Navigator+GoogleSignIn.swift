import GoogleSignIn
import Colors
import CoreUI
import SwiftUI

extension Navigator {
    public func presentGoogleSignIn(
        handleToken: @escaping @Sendable @MainActor (Result<String, Error>) -> Void,
        on presentingViewController: UIViewController
    ) {
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            struct NoResultError: Error {}
            
            let result: Result<String, Error>
            if let error {
                result = .failure(error)
            } else if let signInResult,
                      let idToken = signInResult.user.idToken?.tokenString {
                result = .success(idToken)
            } else {
                result = .failure(NoResultError())
            }
            
            DispatchQueue.main.async {
                handleToken(result)
            }
        }
    }
}
