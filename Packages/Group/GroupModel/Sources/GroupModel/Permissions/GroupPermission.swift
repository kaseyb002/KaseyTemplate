import Foundation

public enum GroupPermission: Hashable, CaseIterable, Codable, Sendable {
    case chat
    case invite
    case removeMember
    case editSettings
    case editPermissions
}

extension GroupPermission {
    public var displayValue: String {
        switch self {
        case .chat:
            "Chat"
            
        case .invite:
            "Send invites"
            
        case .removeMember:
            "Remove group members"
            
        case .editSettings:
            "Edit group settings"
            
        case .editPermissions:
            "Edit permissions"
        }
    }
}

extension Set<GroupPermission> {
    public var isAdmin: Bool {
        contains(.editPermissions)
    }
    
    public static var all: Set<GroupPermission> {
        GroupPermission.allCases.asSet()
    }
}
