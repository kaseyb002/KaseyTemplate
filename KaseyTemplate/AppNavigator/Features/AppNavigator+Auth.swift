import AuthModel
import AuthScreens
import UIKit

extension AppNavigator {
    func makeAuthNavigator() -> AuthScreens.Navigator {
        .init(
            deps: deps.authScreensDeps,
            didSelectNavAction: { [weak self] navAction, navigationController in
                self?.navigate(
                    navAction: navAction,
                    with: navigationController,
                )
            }
        )
    }
    
    private func navigate(
        navAction: AuthScreens.NavAction,
        with navigationController: UINavigationController,
    ) {
        switch navAction {
        case .signedIn(let result):
            // TODO: Replace with dismiss to home view
            navigationController.dismiss(animated: true, completion: nil)

        case .emailSignIn(let completion):
            let requiredData: EmailSignInViewRequiredData = .init(
                completion: completion,
            )
            authNavigator.pushEmailSignIn(
                requiredData: requiredData,
                onto: navigationController,
            )
            
        case .googleSignIn(let handleToken):
            authNavigator.presentGoogleSignIn(
                handleToken: handleToken,
                on: navigationController,
            )
            
        case .dismiss(completion: let completion):
            navigationController.dismiss(animated: true, completion: completion)
            
        case .getHelp:
            break // TODO
            
        case .debugMenu:
            break // TODO
        }
    }
}
