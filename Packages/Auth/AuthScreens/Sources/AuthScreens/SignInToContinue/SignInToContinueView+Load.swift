import AuthModel
import Extensions
import Foundation
import HTTP

extension SignInToContinueView {
    static func load(
        dataStore: SignInToContinueViewDataStore,
        requiredData: SignInToContinueViewRequiredData,
        isPresentedModally: Bool,
    ) async throws -> Model {
        let hostAddress: HostAddress = await dataStore.hostAddress()
        let isDebugMenuEnabled: Bool = try await dataStore.isDebugMenuEnabled()
        return Model(
            context: requiredData.context,
            hostAddress: hostAddress,
            showDebugMenu: isDebugMenuEnabled,
            isPresentedModally: isPresentedModally
        )
    }
}
