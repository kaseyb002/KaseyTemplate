import Foundation

extension EmailSignInView {
    static func load(
        dataStore: EmailSignInViewDataStore,
        requiredData: EmailSignInViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        return Model(
            completion: requiredData.completion
        )
    }
}
