import AuthModel
import Combine
import Foundation
import HTTP

public protocol SignInToContinueViewDataStore: Actor, Sendable {
    var didSignIn: AnyPublisher<Void, Never> { get }
    var didSignOut: AnyPublisher<Void, Never> { get }
    var didUpdateHostAddress: AnyPublisher<HostAddress, Never> { get }

    func signIn(method: SignInMethod) async throws -> TokenResponse
    func hostAddress() async -> HostAddress
    func isDebugMenuEnabled() async throws -> Bool
}
