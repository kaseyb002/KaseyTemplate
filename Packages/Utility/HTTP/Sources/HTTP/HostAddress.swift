import Foundation

public struct HostAddress: Equatable, Sendable {
    public let displayName: String
    public let scheme: String
    public let host: String
    public let port: Int?
    
    public init(
        displayName: String,
        scheme: String,
        host: String,
        port: Int? = nil
    ) {
        self.displayName = displayName
        self.scheme = scheme
        self.host = host
        self.port = port
    }
}
