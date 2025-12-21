import AuthModel
import KaseyCodableStore
import Foundation
import KeychainAccess

public final actor DefaultAuthTokenProvider: AuthTokenProvider {
    private let serviceKey: String
    private let tokenKey: String
    private let savedTokenEventFileStore: any CodableStore<SavedTokenEvent>
    
    public init(
        serviceKey: String,
        tokenKey: String,
        savedTokenEventFileStore: any CodableStore<SavedTokenEvent>
    ) {
        self.serviceKey = serviceKey
        self.tokenKey = tokenKey
        self.savedTokenEventFileStore = savedTokenEventFileStore
    }
    
    public func save(token: String) async throws {
        let keychain: Keychain = .init(service: serviceKey)
        keychain[tokenKey] = token
        let event: SavedTokenEvent = .init(
            id: UUID(),
            savedAt: .now
        )
        try await savedTokenEventFileStore.save(object: event)
    }
    
    public func token() async throws -> String? {
        guard (try? await savedTokenEventFileStore.retrieve()) != nil else {
            return nil
        }
        let keychain: Keychain = .init(service: serviceKey)
        return keychain[tokenKey]
    }
    
    public func removeToken() async throws {
        let keychain: Keychain = .init(service: serviceKey)
        try? await savedTokenEventFileStore.delete()
        return try keychain.remove(tokenKey)
    }
}
