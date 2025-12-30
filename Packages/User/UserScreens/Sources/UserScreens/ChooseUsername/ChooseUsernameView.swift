import Combine
import Extensions
import Colors
import CoreUI
import SwiftUI

struct ChooseUsernameView: LoadableView {
    @State var model: Model
    @FocusState private var focused: Bool
    @State private(set) var typeInUsernameDebouncer: PassthroughSubject<Void, Never> = .init()
    @State var checkingValidityTask: Task<Void, any Error>?
    let deps: Deps

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(spacing: 30) {
                    clearUsernameButtonIfNeeded
                        .opacity(.zero)
                        .allowsHitTesting(false)
                        .accessibilityHidden(true)
                    userTextField
                    clearUsernameButtonIfNeeded
                }
                invalidUsernameExplanationLabelIfNeeded
                submitButton
            }
            .animation(.default, value: model.checkingValidityState)
            .animation(.default, value: model.submissionState)
        }
        .contentMargins(20, for: .scrollContent)
        .subscribeToUpdates(subscribeToUpdates)
    }
    
    init(
        model: Model,
        deps: Deps
    ) {
        self.model = model
        self.deps = deps
    }
}

// MARK: - Subviews
extension ChooseUsernameView {
    private var userTextField: some View {
        TextField(
            "Username",
            text: .init(
                get: { model.username },
                set: { handle(action: .ui(.usernameTextChanged($0))) }
            )
        )
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .font(.title2)
        .bold()
        .keyboardType(.namePhonePad)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.3)
        .focused($focused)
        .onAppear { focused = true }
    }
    
    @ViewBuilder
    private var clearUsernameButtonIfNeeded: some View {
        if model.username.isEmpty == false {
            Button(action: { handle(action: .ui(.clearUsernameTapped)) }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(Color.ijTertiaryLabel)
            }
            .buttonStyle(.plain)
        }
    }
    
    @ViewBuilder
    private var submitButton: some View {
        switch model.submissionState {
        case .idle:
            PrimaryButton(title: "Submit") {
                handle(action: .ui(.submitTapped))
            }
            .disabled(model.isSubmitButtonDisabled)
            .opacity(model.isSubmitButtonDisabled ? 0.5 : 1)
            
        case .submitting:
            LoadingSpinnerView()
        }
    }
    
    @ViewBuilder
    private var invalidUsernameExplanationLabelIfNeeded: some View {
        if let invalidUsernameExplanation: String = model.invalidUsernameExplanation {
            Text(invalidUsernameExplanation)
                .foregroundStyle(.red)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
    }
}
