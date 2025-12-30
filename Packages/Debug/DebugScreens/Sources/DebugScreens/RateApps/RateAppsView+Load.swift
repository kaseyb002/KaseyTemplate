import Foundation

extension RateAppsView {
    nonisolated static func load(
        dataStore: RateAppsViewDataStore,
        requiredData: RateAppsViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        return Model(
            isPresentedModally: isPresentedModally
        )
    }
}