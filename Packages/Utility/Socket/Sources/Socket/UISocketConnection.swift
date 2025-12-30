import Combine
import Foundation

/// Limited interface for managing socket connections
public protocol UISocketConnection: Sendable {
    var connectionStatus: CurrentValueSubject<SocketConnectionStatus, Never> { get }
    var urlRequest: URLRequest { get }
    func disconnect()
}
