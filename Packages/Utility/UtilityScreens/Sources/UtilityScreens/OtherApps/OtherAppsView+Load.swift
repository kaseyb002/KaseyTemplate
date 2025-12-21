import Foundation
import UtilityModel

extension OtherAppsView {
    nonisolated static func load(
        dataStore: OtherAppsViewDataStore,
        requiredData: OtherAppsViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        return Model(
            otherApps: .all.filter { requiredData.exclude.contains($0.id) == false },
            isPresentedModally: isPresentedModally
        )
    }
}
