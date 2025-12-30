import Foundation

public struct OnboardingPrompt: Equatable, Codable, Sendable {
    public var lastPrompted: Date?
    public var promptCount: Int
    public var hasPrompted: Bool { lastPrompted != nil }
    
    public mutating func recordPrompt() {
        promptCount += 1
        lastPrompted = .now
    }
    
    public init(
        lastPrompted: Date? = nil,
        promptCount: Int = .zero,
    ) {
        self.lastPrompted = lastPrompted
        self.promptCount = promptCount
    }
}
