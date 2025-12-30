import Combine
import Extensions
import Foundation

public protocol SocketClient: Actor, Sendable {
    var hostAddress: HostAddress { get }

    func connectSocket(
        request: any SocketConnectionRequest,
        decoder: JSONDecoder
    ) async throws -> SocketConnection
    
    func disconnect(
        socket: UISocketConnection
    ) async throws

    func update(hostAddress: HostAddress) async
}
