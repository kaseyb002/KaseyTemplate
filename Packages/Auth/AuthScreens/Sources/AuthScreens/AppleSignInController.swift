import AuthenticationServices
import Combine
import UIKit

struct AppleTokens {
    let idToken: String
    let accessToken: String
    let fullName: PersonNameComponents? // Optional – only available on first login
}

final class AppleSignInController: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    var handleTokens: (Result<AppleTokens, Error>) -> Void = { _ in }

    func signIntoApple(
        handleTokens: @escaping (Result<AppleTokens, Error>) -> Void
    ) {
        self.handleTokens = handleTokens
        
        let request: ASAuthorizationAppleIDRequest = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

    // MARK: - Presentation Anchor
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let window: UIWindow = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow })
            .first
        else {
            logIt(.error, "presentationAnchor for Apple Sign-In failed to find a window")
            struct FailedToFindPresentationAnchorError: Error {}
            handleTokens(.failure(FailedToFindPresentationAnchorError()))
            return UIWindow()
        }
        return window
    }

    // MARK: - Delegate Success
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            logIt(.error, "Apple credential casting failed")
            struct InvalidCredentialError: Error {}
            handleTokens(.failure(InvalidCredentialError()))
            return
        }

        guard
            let idTokenData = credential.identityToken,
            let idToken = String(data: idTokenData, encoding: .utf8),
            let accessTokenData = credential.authorizationCode,
            let accessToken = String(data: accessTokenData, encoding: .utf8)
        else {
            logIt(.error, "Failed to extract id_token or access_token")
            struct TokenExtractionError: Error {}
            handleTokens(.failure(TokenExtractionError()))
            return
        }

        let fullName: PersonNameComponents? = credential.fullName // Will be nil on returning logins

        handleTokens(.success(.init(idToken: idToken, accessToken: accessToken, fullName: fullName)))
    }

    // MARK: - Delegate Failure
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        logIt(.error, "Apple Sign-In error: \(error.localizedDescription)")
        handleTokens(.failure(error))
    }
}
