import Combine
import DebugModel
import Foundation
import KaseyCodableStore

public final actor DefaultDebugDataStore: DebugDataStore {
    private nonisolated(unsafe) let didSaveDebugConfigSubject: PassthroughSubject<DebugConfig, Never> = .init()
    private let configFileStore: any CodableStore<DebugConfig>
    
    public init(
        configFileStore: any CodableStore<DebugConfig>,
    ) {
        self.configFileStore = configFileStore
    }
}

extension DefaultDebugDataStore {
    public func debugConfig() async throws -> DebugModel.DebugConfig {
        (try? await configFileStore.retrieve()) ?? .init()
    }
    
    public func saveDebugConfig<V>(
        _ keyPath: WritableKeyPath<DebugModel.DebugConfig, V>,
        value: V,
    ) async throws {
        var updatedConfig: DebugConfig = try await debugConfig()
        updatedConfig[keyPath: keyPath] = value
        try await configFileStore.save(object: updatedConfig)
        didSaveDebugConfigSubject.send(updatedConfig)
    }
    
    public nonisolated var didSaveDebugConfig: AnyPublisher<DebugConfig, Never> {
        didSaveDebugConfigSubject.eraseToAnyPublisher()
    }
}
