import Foundation

extension AddLinkView {
    static func load(
        dataStore: AddLinkViewDataStore,
        requiredData: AddLinkViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        return Model(
            linkString: requiredData.mode.linkString,
            isPresentedModally: isPresentedModally,
            didAddLink: requiredData.didAddLink
        )
    }
}
