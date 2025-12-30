import Foundation
import UserModel

public protocol ChooseUsernameViewDataStore: Actor, Sendable {
    func update(username: String) async throws -> User
    
    func validate(username: String) async throws -> ValidUsernameStatus
    
    func myUser() async throws -> User
}
