import Foundation

public enum SocketConnectionStatus: Equatable, Sendable {
    case idle
    case connecting
    case connected
    case intentionallyDisconnected
    case unintentionallyDisconnected
    
    public var isConnectedOrConnecting: Bool {
        switch self {
        case .idle, .intentionallyDisconnected, .unintentionallyDisconnected:
            false
            
        case .connected, .connecting:
            true
        }
    }
}
