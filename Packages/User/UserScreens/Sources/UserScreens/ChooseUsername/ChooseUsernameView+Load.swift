import Foundation
import UserModel

extension ChooseUsernameView {
    nonisolated static func load(
        dataStore: ChooseUsernameViewDataStore,
        requiredData: ChooseUsernameViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        let username: String
        let myUser: User = try await dataStore.myUser()
        if myUser.username == myUser.email {
            username = ""
        } else {
            username = myUser.username
        }
        return Model(
            navActionOnSuccess: requiredData.navActionOnSuccess,
            myUsername: myUser.username,
            username: username
        )
    }
}
