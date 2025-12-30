import AuthModel
import Extensions
import Foundation
import HTTP

public protocol AuthClient: Actor, Sendable {
    func createAccount(
        email: String,
        password: String
    ) async throws -> TokenResponse

    func signIn(
        method: SignInMethod
    ) async throws -> TokenResponse
    
    func update(hostAddress: HostAddress) async
    
    func hostAddress() async -> HostAddress
}
