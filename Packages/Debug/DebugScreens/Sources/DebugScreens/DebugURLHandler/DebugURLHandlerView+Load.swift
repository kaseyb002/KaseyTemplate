import Foundation
import GroupModel
import NotificationsModel

extension DebugURLHandlerView {
    nonisolated static func load(
        dataStore: DebugURLHandlerViewDataStore,
        requiredData: DebugURLHandlerViewRequiredData,
        isPresentedModally: Bool,
    ) async throws -> Model {
        let groupDetailsPage: GroupDetailPage? = await dataStore.cachedGroupDetailsFirstPage()
        let urls: [Model.URLDestination] = try await urlDestinations(
            with: groupDetailsPage?.groupDetails,
            dataStore: dataStore,
        )
        let pushNotificationAppActions: [PushNotificationAppAction] = pushNotificationAppActions(with: groupDetailsPage?.groupDetails)
        return Model(
            pushCount: requiredData.pushCount + (isPresentedModally ? 0 : 1),
            modalCount: requiredData.modalCount + (isPresentedModally ? 1 : 0),
            urls: urls,
            pushNotificationAppActions: pushNotificationAppActions,
            isPresentedModally: isPresentedModally,
        )
    }
    
    nonisolated private static func backupPushNotificationAppActions() -> [PushNotificationAppAction] {
        [
            .viewGroups,
        ]
    }
    
    nonisolated private static func pushNotificationAppActions(
        with groupDetails: [GroupDetail]?,
    ) -> [PushNotificationAppAction] {
        guard let groupDetails: [GroupDetail] = groupDetails,
              let firstGroup: GroupDetail = groupDetails.first
        else {
            return backupPushNotificationAppActions()
        }
        var actions: [PushNotificationAppAction] = []
        let tokenActionToEnforceCompilerErrorWhenAddingNewActions: PushNotificationAppAction = .viewGroups
        switch tokenActionToEnforceCompilerErrorWhenAddingNewActions {
        case .viewChat,
                .viewGroupMember,
                .viewGroups:
            break // please append a new action below
        }
        actions.append(.viewGroupMember(firstGroup.myGroupMember.groupMemberID))
        actions.append(.viewGroups)
        return actions
    }
    
    nonisolated private static func backupURLDestinations() -> [Model.URLDestination] {
        [
            .init(
                // TODO: Replace
                url: URL(string: "https://kaseytemplate.app/groups/join?code=FiwYvLBqJfpwdfpSsM6SFF")!,
                title: "Group invite"
            ),
        ]
    }
    
    nonisolated private static func urlDestinations(
        with groupDetails: [GroupDetail]?,
        dataStore: DebugURLHandlerViewDataStore,
    ) async throws -> [Model.URLDestination] {
        guard let groupDetails: [GroupDetail] = groupDetails,
              let firstGroup: GroupDetail = groupDetails.first(where: { $0.myGroupMember.permissions.isAdmin }) ?? groupDetails.first,
              let invitesPage: GroupInvitesPage = try? await dataStore.groupInvites(
                groupID: firstGroup.group.id,
                pageIndex: nil,
              )
        else {
            return backupURLDestinations()
        }
        var urls: [Model.URLDestination] = []
        if let invite: GroupInvite = invitesPage.groupInvites.first(where: { $0.isUsed == false }) {
            urls.append(.init(
                url: invite.inviteURL,
                title: "Group Invite",
            ))
        }
        if let url: Model.URLDestination = handLogURLDestination(from: groupDetails) {
            urls.append(url)
        }
        
        if urls.isEmpty {
            return backupURLDestinations()
        }
        return urls
    }
}
