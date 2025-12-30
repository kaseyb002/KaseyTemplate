import Combine
import DebugModel
import Foundation
import UserModel

public protocol HelpViewDataStore: Actor, Sendable {
    func signOut() async throws
    
    func myUser() async throws -> User
    
    func debugConfig() async throws -> DebugConfig
    
    func saveDebugConfig<V>(
        _ keyPath: WritableKeyPath<DebugConfig, V>,
        value: V,
    ) async throws
}
