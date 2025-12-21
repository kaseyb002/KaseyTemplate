import Foundation

public protocol AuthTokenProvider: Sendable {
    func token() async throws -> String?
    func save(token: String) async throws
    func removeToken() async throws
}
