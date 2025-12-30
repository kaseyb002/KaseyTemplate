import Combine
import Foundation
import UserModel

public protocol DeleteAccountViewDataStore: Actor, Sendable {
    func deleteAccount() async throws
    
    func myUser() async throws -> User
}
