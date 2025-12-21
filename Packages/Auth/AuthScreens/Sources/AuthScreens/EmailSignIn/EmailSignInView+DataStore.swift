import Foundation
import AuthModel

public protocol EmailSignInViewDataStore: Actor, Sendable {
    func createAccount(
        email: String,
        password: String
    ) async throws -> TokenResponse

    func signIn(
        method: SignInMethod
    ) async throws -> TokenResponse
}
