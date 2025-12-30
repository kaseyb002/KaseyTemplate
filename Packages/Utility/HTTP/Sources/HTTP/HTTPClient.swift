import Extensions
import Foundation

public protocol HTTPClient: Actor, Sendable {
    func send<R: HTTPRequest> (_ request: R) async throws -> R.ResponseType
    
    func update(hostAddress: HostAddress) async

    var hostAddress: HostAddress { get }
}
