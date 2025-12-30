import Combine
import Foundation
import LocalSettingsModel

public protocol OnboardingPromptsDebugViewDataStore {
    func onboardingPrompts() async throws -> OnboardingPrompts
    
    func save<T>(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, T>,
        value: T
    ) async throws where T : Equatable & Sendable
}
