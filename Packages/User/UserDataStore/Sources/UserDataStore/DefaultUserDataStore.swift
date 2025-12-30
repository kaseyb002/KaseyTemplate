import Combine
import UIKit
import UserModel
import UserClient

public final actor DefaultUserDataStore: UserDataStore {
    private let client: UserClient
    private let externalStore: any UserDataStoreExternalStore
    public let userDidRefresh: PassthroughSubject<User, Never> = .init()

    public init(
        client: UserClient,
        externalStore: any UserDataStoreExternalStore
    ) {
        self.client = client
        self.externalStore = externalStore
    }
}

extension DefaultUserDataStore {
    public func myUser() async throws -> User {
        if let storedUser: User = try? await storedUser() {
            return storedUser
        } else {
            return try await refreshStoredUser()
        }
    }
    
    public func storedUser() async throws -> User? {
        try await externalStore.savedUser()
    }
    
    public func refreshStoredUser() async throws -> User {
        let user: User = try await client.myUser()
        try await didRefresh(user: user)
        return user
    }
    
    public func update(username: String) async throws -> User {
        let user: User = try await client.update(username: username)
        try await didRefresh(user: user)
        return user
    }
    
    public func validate(
        username: String
    ) async throws -> ValidUsernameStatus {
        try await client.validate(username: username)
    }

    public func update(
        profileImage: UIImage,
    ) async throws -> User {
        let user: User = try await client.update(profileImage: profileImage)
        try await didRefresh(user: user)
        return user
    }
    
    public func deleteAccount() async throws {
        try await client.deleteAccount()
        try await externalStore.signOut()
    }
}

// MARK: - Local Storage
extension DefaultUserDataStore {
    private func didRefresh(user: User) async throws {
        try await externalStore.save(user: user)
        userDidRefresh.send(user)
    }
}

public protocol UserDataStoreExternalStore: Sendable {
    func save(user: User) async throws
    func savedUser() async throws -> User
    func signOut() async throws
}
