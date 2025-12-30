import Foundation

public struct OnboardingPrompts: Equatable, Codable, Sendable {
    public var hasSeenTurnOnNotifications: OnboardingPrompt

    public init(
        hasSeenTurnOnNotifications: OnboardingPrompt = .init(),
    ) {
        self.hasSeenTurnOnNotifications = hasSeenTurnOnNotifications
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hasSeenTurnOnNotifications = try container.decodeIfPresent(OnboardingPrompt.self, forKey: .hasSeenTurnOnNotifications) ?? .init()
    }
}
