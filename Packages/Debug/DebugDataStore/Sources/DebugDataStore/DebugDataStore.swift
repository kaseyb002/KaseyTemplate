import Combine
import DebugModel
import Foundation

public protocol DebugDataStore: Actor, Sendable {
    func debugConfig() async throws -> DebugConfig
    
    func saveDebugConfig<V>(
        _ keyPath: WritableKeyPath<DebugConfig, V>,
        value: V,
    ) async throws
    
    nonisolated var didSaveDebugConfig: AnyPublisher<DebugConfig, Never> { get }
}
