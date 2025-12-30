import Foundation

public struct PermissionsResponse: Equatable, Codable, Sendable {
    public let canEditPermissions: Bool
    public let canEditSettings: Bool
    public let canSendInvite: Bool
    public let canRemoveMember: Bool
    public let canChat: Bool
    
    public init(
        canEditPermissions: Bool,
        canEditSettings: Bool,
        canSendInvite: Bool,
        canRemoveMember: Bool,
        canChat: Bool,
    ) {
        self.canEditPermissions = canEditPermissions
        self.canEditSettings = canEditSettings
        self.canSendInvite = canSendInvite
        self.canRemoveMember = canRemoveMember
        self.canChat = canChat
    }

    public init(permissions: Set<GroupPermission>) {
        self.init(
            canEditPermissions: permissions.isAdmin,
            canEditSettings: permissions.contains(.editSettings),
            canSendInvite: permissions.contains(.invite),
            canRemoveMember: permissions.contains(.removeMember),
            canChat: permissions.contains(.chat),
        )
    }
}

extension Set<GroupPermission> {
    public init(response: PermissionsResponse) {
        var permissions: Set<GroupPermission> = []
        for permission in GroupPermission.allCases {
            switch permission {
            case .chat:
                if response.canChat {
                    permissions.insert(.chat)
                }
                
            case .invite:
                if response.canSendInvite {
                    permissions.insert(.invite)
                }
                
            case .removeMember:
                if response.canRemoveMember {
                    permissions.insert(.removeMember)
                }
                
            case .editSettings:
                if response.canEditSettings {
                    permissions.insert(.editSettings)
                }
                
            case .editPermissions:
                if response.canEditPermissions {
                    permissions.insert(.editPermissions)
                }
            }
        }
        
        self = permissions
    }
}
