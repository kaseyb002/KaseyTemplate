import Combine
import Foundation
import UserModel

extension TurnOnNotificationsPromptView {
    static func load(
        dataStore: TurnOnNotificationsPromptViewDataStore,
        requiredData: TurnOnNotificationsPromptViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        async let myUser: User = dataStore.myUser()
        return try await Model(
            user: myUser
        )
    }
}
