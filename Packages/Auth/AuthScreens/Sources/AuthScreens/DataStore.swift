import AuthModel
import Foundation
import Foundation
import HTTP

public protocol DataStore:
    EmailSignInViewDataStore,
    SignInToContinueViewDataStore,
    Actor,
    Sendable
{
    func isDebugMenuEnabled() async throws -> Bool
    func hostAddress() async -> HostAddress
}
