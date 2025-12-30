import Combine
import Foundation
import GroupModel

public protocol DebugURLHandlerViewDataStore {
    func cachedGroupDetailsFirstPage() async -> GroupDetailPage?

    func groupInvites(
        groupID: GroupID,
        pageIndex: Int?
    ) async throws -> GroupInvitesPage
}
