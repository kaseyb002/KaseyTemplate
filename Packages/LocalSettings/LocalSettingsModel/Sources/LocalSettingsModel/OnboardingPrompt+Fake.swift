import Extensions
import Foundation

extension OnboardingPrompt {
    public static func fake(
        lastPrompted: Date? = Bool.random() ? .now.addDays(-1 * .random(in: 1 ... 20)) : nil,
        promptCount: Int = Bool.random() ? .random(in: 1 ... 10) : .zero,
    ) -> OnboardingPrompt {
        .init(
            lastPrompted: lastPrompted,
            promptCount: promptCount,
        )
    }
}
