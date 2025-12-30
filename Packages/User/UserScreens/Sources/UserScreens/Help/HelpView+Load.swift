import DebugModel
import Foundation
import UserModel

extension HelpView {
    nonisolated static func load(
        dataStore: HelpViewDataStore,
        requiredData: HelpViewRequiredData,
        isPresentedModally: Bool,
    ) async throws -> Model {
        async let user: User? = try? await dataStore.myUser()
        async let debugConfig: DebugConfig = try await dataStore.debugConfig()
        return try await Model(
            user: user,
            isModallyPresented: requiredData.isModallyPresented,
            isDebugMenuEnabled: debugConfig.isDebugMenuEnabled,
        )
    }
}
