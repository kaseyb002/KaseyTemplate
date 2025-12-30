import AuthModel
import Extensions
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
