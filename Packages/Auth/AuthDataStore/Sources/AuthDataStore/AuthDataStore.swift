import AuthModel
import Combine
import Extensions
import Foundation
import HTTP

public protocol AuthDataStore: Actor, Sendable {
    nonisolated var didSignIn: AnyPublisher<Void, Never> { get }
    nonisolated var didSignOut: AnyPublisher<Void, Never> { get }
    nonisolated var didUpdateHostAddress: AnyPublisher<HostAddress, Never> { get }

    func signIn(method: SignInMethod) async throws -> TokenResponse

    func createAccount(email: String, password: String) async throws -> TokenResponse

    func isAuthenticated() async throws -> Bool

    func signOut() async throws

    func update(hostAddress: HostAddress) async

    func hostAddress() async -> HostAddress
}
