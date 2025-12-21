import SwiftUI

extension Backport where Content: View {
    public enum DropPhase: Equatable {
        /// The drop session is entering the drop destination.
        case entering
        /// The drop session is active inside the drop destination.
        case active
        /// The drop session has exited the drop destination.
        case exiting
        /// The drop has ended.
        case ended
        
        @available(iOS 26.0, *)
        public init(systemPhase: DropSession.Phase) {
            switch systemPhase {
            case .entering:
                self = .entering
                
            case .active:
                self = .active
                
            case .exiting:
                self = .exiting
                
            case .ended:
                self = .ended
                
            case .dataTransferCompleted:
                self = .active
                
            @unknown default:
                self = .exiting
            }
        }
    }

    @ViewBuilder
    nonisolated public func dropDestination<T>(
        for type: T.Type = T.self,
        isEnabled: Bool = true,
        action: @escaping (_ items: [T], DropPhase) -> Void
    ) -> some View where T : Transferable {
        if #available(iOS 26.0, *) {
            content
                .dropDestination(
                    for: type,
                    isEnabled: isEnabled,
                    action: { items, session in
                        action(items, DropPhase(systemPhase: session.phase))
                    }
                )
        } else {
            content
        }
    }
}
