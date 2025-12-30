import Foundation

extension OnboardingPrompts {
    public static func fake(
        hasSeenTurnOnNotifications: OnboardingPrompt = .fake(),
    ) -> OnboardingPrompts {
        OnboardingPrompts(
            hasSeenTurnOnNotifications: hasSeenTurnOnNotifications,
        )
    }
}
