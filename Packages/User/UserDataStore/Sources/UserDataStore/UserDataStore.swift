import Combine
import UIKit
import UserModel

public protocol UserDataStore: Actor, Sendable {
    func myUser() async throws -> User
   
    func storedUser() async throws -> User?
    
    func refreshStoredUser() async throws -> User
    
    func update(username: String) async throws -> User
    
    func validate(
        username: String,
    ) async throws -> ValidUsernameStatus

    func update(
        profileImage: UIImage,
    ) async throws -> User
    
    func deleteAccount() async throws
}
