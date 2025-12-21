import AuthClient
import AuthModel
import AuthTokenProvider
import Combine
import Foundation
import HTTP
import Logger

public final actor DefaultAuthDataStore: AuthDataStore {
    private let client: any AuthClient
    private let authTokenProvider: any AuthTokenProvider
    private let externalStore: any AuthExternalDataStore
    private var didSignInSubscription: AnyCancellable?
    private var didSignOutSubscription: AnyCancellable?
    private nonisolated(unsafe) let didSignInSubject: PassthroughSubject<Void, Never> = .init()
    private nonisolated(unsafe) let didSignOutSubject: PassthroughSubject<Void, Never> = .init()
    private nonisolated(unsafe) let didUpdateHostAddressSubject: PassthroughSubject<HostAddress, Never> = .init()

    public init(
        client: any AuthClient,
        authTokenProvider: any AuthTokenProvider,
        externalStore: any AuthExternalDataStore,
    ) {
        self.client = client
        self.authTokenProvider = authTokenProvider
        self.externalStore = externalStore
        
        Task {
            await setupSubcriptions()
        }
    }
}

extension DefaultAuthDataStore {
    public nonisolated var didSignIn: AnyPublisher<Void, Never> {
        didSignInSubject.eraseToAnyPublisher()
    }
    
    public nonisolated var didSignOut: AnyPublisher<Void, Never> {
        didSignOutSubject.eraseToAnyPublisher()
    }
    
    public nonisolated var didUpdateHostAddress: AnyPublisher<HostAddress, Never> {
        didUpdateHostAddressSubject.eraseToAnyPublisher()
    }
    
    public func signIn(method: SignInMethod) async throws -> TokenResponse {
        let tokenResponse: TokenResponse = try await client.signIn(method: method)
        try await authTokenProvider.save(token: tokenResponse.token)
        try await externalStore.registerForRemoteNotificationsIfAuthorizationHasBeenGranted()
        didSignInSubject.send()
        return tokenResponse
    }
    
    public func createAccount(
        email: String,
        password: String
    ) async throws -> TokenResponse {
        let tokenResponse: TokenResponse = try await client.createAccount(
            email: email,
            password: password
        )
        try await authTokenProvider.save(token: tokenResponse.token)
        didSignInSubject.send()
        return tokenResponse
    }

    public func isAuthenticated() async throws -> Bool {
        let isAuthenticated: Bool = try await authTokenProvider.token() != nil
        if isAuthenticated == false { // handle some other way
            try await removeStoredUser()
        }
        return isAuthenticated
    }
    
    public func signOut() async throws {
        try await removeStoredUser()
        didSignOutSubject.send()
    }
    
    private func removeStoredUser() async throws {
        try? await externalStore.deletePushRegistration()
        try? await externalStore.deleteStoredUser()
        try? await externalStore.deleteCaches()
        try await authTokenProvider.removeToken()
    }
    
    public func update(hostAddress: HostAddress) async {
        await client.update(hostAddress: hostAddress)
        didUpdateHostAddressSubject.send(hostAddress)
    }
    
    public func hostAddress() async -> HostAddress {
        await client.hostAddress()
    }
}

// MARK: - Subscriptions
extension DefaultAuthDataStore {
    private func setupSubcriptions() {
        setupDidDetectUnauthorizedSubscription()
        setupDidSignInSubscription()
    }
    
    private func setupDidSignInSubscription() {
        didSignInSubscription = didSignIn
            .sink { [weak self] in
                Task { [weak self] in
                    await self?.setupDidDetectUnauthorizedSubscription()
                }
            }
    }
    
    private func setupDidDetectUnauthorizedSubscription() {
        didSignOutSubscription?.cancel()
        didSignOutSubscription = externalStore.didDetectUnauthorized
            .sink { [weak self] in
                Task { [weak self] in
                    await self?.handleUnauthorizedDetected()
                }
            }
    }
    
    private func handleUnauthorizedDetected() {
        // kill the subscription to avoid repeated calls
        didSignOutSubscription?.cancel()
        didSignOutSubscription = nil
        Task {
            do {
                try await signOut()
            } catch {
                logIt(.error, "Detected authorized call, but failed to automatically sign the user out.")
            }
        }
    }
}

public protocol AuthExternalDataStore: Sendable {
    func deleteStoredUser() async throws
    func deletePushRegistration() async throws
    func deleteCaches() async throws
    func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws

    var didDetectUnauthorized: AnyPublisher<Void, Never> { get }
}
