import Foundation

public struct LocalSettings: Equatable, Codable, Sendable {
    public var isSoundEffectsEnabled: Bool
    
    public init(
        isSoundEffectsEnabled: Bool = true,
    ) {
        self.isSoundEffectsEnabled = isSoundEffectsEnabled
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isSoundEffectsEnabled = try container.decodeIfPresent(Bool.self, forKey: .isSoundEffectsEnabled) ?? true
    }
}
