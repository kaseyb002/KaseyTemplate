import AuthModel
import Combine
import Foundation
import HTTP

public final actor FakeDataStore: DataStore {
    public func isDebugMenuEnabled() async throws -> Bool {
        true
    }
    
    public func hostAddress() async -> HostAddress {
        .fake()
    }
    
    public let didSignIn: AnyPublisher<Void, Never> = Empty().eraseToAnyPublisher()
    public let didSignOut: AnyPublisher<Void, Never> = Empty().eraseToAnyPublisher()
    public let didUpdateHostAddress: AnyPublisher<HostAddress, Never> = Empty().eraseToAnyPublisher()
    
    public func createAccount(
        email: String,
        password: String,
    ) async throws -> TokenResponse {
        .fake()
    }
    
    public func signIn(
        method: SignInMethod,
    ) async throws -> TokenResponse {
        .fake()
    }
    
    public func signOut() async throws {
        
    }
}
