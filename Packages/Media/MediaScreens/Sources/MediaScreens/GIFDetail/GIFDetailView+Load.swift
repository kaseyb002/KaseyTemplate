import Foundation

extension GIFDetailView {
    static func load(
        dataStore: GIFDetailViewDataStore,
        requiredData: GIFDetailViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        return Model(
            gifURL: requiredData.gifURL,
            isPresentedModally: isPresentedModally
        )
    }
}
