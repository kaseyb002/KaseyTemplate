import Colors
import CoreUI
import LocalSettingsModel
import SwiftUI

struct OnboardingPromptRowView: View {
    let title: String
    let prompt: OnboardingPrompt
    let handleAction: (Action) -> Void
    
    enum Action {
        case recordPromptTapped
        case resetTapped
        case dateChanged(Date)
        case decrementCountTapped
        case incrementCountTapped
    }
    
    var body: some View {
        VStack {
            HStack {
                titleLabel
                recordPromptOrResetButton
            }
            promptCountLabelIfNeeded
            datePickerIfNeeded
        }
        .animation(.default, value: prompt)
    }
}

// MARK: - Subviews
extension OnboardingPromptRowView {
    private var titleLabel: some View {
        Text(title)
            .foregroundStyle(Color.ijLabel)
            .bold()
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private var promptCountLabelIfNeeded: some View {
        if prompt.promptCount > .zero {
            Divider()
            HStack {
                Text("Prompt count")
                    .foregroundStyle(Color.ijLabel)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: { handleAction(.decrementCountTapped) }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(Color.ijInteractive)
                }
                .buttonStyle(.plain)
                
                Text("\(prompt.promptCount)")
                    .foregroundStyle(Color.ijLabel)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)

                Button(action: { handleAction(.incrementCountTapped) }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(Color.ijInteractive)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    @ViewBuilder
    private var recordPromptOrResetButton: some View {
        if prompt.hasPrompted {
            Button("Reset", role: .destructive) {
                handleAction(.resetTapped)
            }
            .foregroundStyle(Color.ijInteractive)
            .buttonStyle(.plain)
        } else {
            Button(action: { handleAction(.recordPromptTapped) }) {
                Text("Record")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.ijInteractive)
                    .mask(RoundedRectangle(cornerRadius: 8))
            }
            .buttonStyle(.plain)
        }
    }
    
    @ViewBuilder
    private var datePickerIfNeeded: some View {
        if let lastPrompted: Date = prompt.lastPrompted {
            Divider()
            DatePicker(
                "Last prompted",
                selection: .init(
                    get: { lastPrompted },
                    set: { handleAction(.dateChanged($0)) }
                ),
                displayedComponents: .date
            )
            .tint(Color.ijInteractive)
        }
    }
}
