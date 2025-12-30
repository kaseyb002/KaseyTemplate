import Foundation
import UserModel

extension DeleteAccountView {
    nonisolated static func load(
        dataStore: DeleteAccountViewDataStore,
        requiredData: DeleteAccountViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        let user = try await dataStore.myUser()
        return Model(
            isPresentedModally: isPresentedModally,
            myUsername: user.username
        )
    }
}
