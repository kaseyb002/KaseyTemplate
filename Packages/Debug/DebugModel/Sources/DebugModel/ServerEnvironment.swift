import Foundation

public enum ServerEnvironment: String, Codable, Equatable, Sendable, CaseIterable {
    case prod
    #if DEBUG
    case localDev
    #endif
}
