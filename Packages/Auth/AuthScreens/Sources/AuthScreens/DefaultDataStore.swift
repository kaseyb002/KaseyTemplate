import AuthModel
import AuthDataStore
import Combine
import Extensions
import Foundation
import HTTP

public final actor DefaultDataStore: DataStore {
    private let authDataStore: any AuthDataStore
    
    public init(
        authDataStore: any AuthDataStore,
    )  {
        self.authDataStore = authDataStore
    }
    
    public func createAccount(
        email: String,
        password: String,
    ) async throws -> TokenResponse {
        try await authDataStore.createAccount(
            email: email,
            password: password
        )
    }
    
    public func signIn(
        method: SignInMethod,
    ) async throws -> TokenResponse {
        try await authDataStore.signIn(method: method)
    }
    
    public func hostAddress() async -> HostAddress {
        await authDataStore.hostAddress()
    }
    
    public func isDebugMenuEnabled() async throws -> Bool {
        // TODO: Implement debug menu logic
        return false
    }
    
    public var didSignIn: AnyPublisher<Void, Never> {
        authDataStore.didSignIn
    }
    
    public var didSignOut: AnyPublisher<Void, Never> {
        authDataStore.didSignOut
    }
    
    public var didUpdateHostAddress: AnyPublisher<HostAddress, Never> {
        authDataStore.didUpdateHostAddress
    }
}
