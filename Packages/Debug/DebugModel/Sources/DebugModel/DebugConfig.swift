import Foundation

public struct DebugConfig: Equatable, Codable, Sendable {
    public var isDebugMenuEnabled: Bool
    public var serverEnvironment: ServerEnvironment
    public var isDisplayingSocketIndicators: Bool
    
    public init(
        isDebugMenuEnabled: Bool = false,
        serverEnvironment: ServerEnvironment = .prod,
        isDisplayingSocketIndicators: Bool = false,
    ) {
        self.isDebugMenuEnabled = isDebugMenuEnabled
        self.serverEnvironment = serverEnvironment
        self.isDisplayingSocketIndicators = isDisplayingSocketIndicators
    }
}
