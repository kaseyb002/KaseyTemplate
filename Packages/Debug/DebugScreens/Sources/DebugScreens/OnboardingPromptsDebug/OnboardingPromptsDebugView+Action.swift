import Foundation
import LocalSettingsModel

extension OnboardingPromptsDebugView {
    enum Action {
        case initiated
        case ui(UI)
        
        enum UI {
            case row(
                prompt: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
                action: OnboardingPromptRowView.Action
            )
        }
    }
}
