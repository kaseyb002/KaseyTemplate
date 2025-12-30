import Foundation

extension GroupInvite {
    public var isUsed: Bool {
        switch lifetime {
        case .oneTime(let usedByUserID):
            usedByUserID != nil
            
        case .permanent:
            false
        }
    }
}
