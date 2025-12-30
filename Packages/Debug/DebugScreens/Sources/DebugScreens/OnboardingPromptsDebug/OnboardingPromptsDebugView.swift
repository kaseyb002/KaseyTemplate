import LocalSettingsModel
import SwiftUI

struct OnboardingPromptsDebugView: View {
    @ObservedObject var controller: Controller
    private var model: Model { controller.model }
    
    var body: some View {
        Form {
            toggle(for: \.hasSeenWeWillNotifyWhenItsYourTurn, title: "We will notify you when it's your turn")
            toggle(for: \.hasDismissedTurnOnNotificationsForYourTurnBanner, title: "Your notifications are off banner")
            toggle(for: \.hasDismissedLearnPokerBanner, title: "Has dismissed Learn Poker Banner")
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Subviews
extension OnboardingPromptsDebugView {
    @ViewBuilder
    func toggle(
        for prompt: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        title: String
    ) -> some View {
        Section {
            OnboardingPromptRowView(
                title: title,
                prompt: model.onboardingPrompts[keyPath: prompt],
                handleAction: { action in
                    controller.handle(action: .ui(.row(prompt: prompt, action: action)))
                }
            )
        }
        .listRowBackground(Color.ijSecondaryBackground)
    }
}
