import Colors
import CoreUI
import SwiftUI

struct DeleteAccountView: LoadableView {
    @State var model: Model
    @FocusState private var focused: Bool
    let deps: Deps
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                warningSection
                usernameInputSection
                deleteButton
            }
        }
        .contentMargins(20)
        .animation(.default, value: model.submissionState)
        .animation(.default, value: model.isDeleteButtonDisabled)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButtonIfNeeded
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension DeleteAccountView {
    private var warningSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 48))
                .foregroundStyle(.red)
            
            Text("This action cannot be undone")
                .foregroundStyle(Color.ijLabel)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("Deleting your account will permanently remove all your data, including your profile, game history, and settings. You will not be able to recover this information.")
                .font(.body)
                .foregroundStyle(Color.ijSecondaryLabel)
                .multilineTextAlignment(.center)
        }
    }
    
    private var usernameInputSection: some View {
        VStack(spacing: 12) {
            Text("To confirm deletion, please type your username:")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.ijLabel)

            Text("\(model.myUsername)")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.ijSecondaryLabel)

            TextField(
                "Your username",
                text: .init(
                    get: { model.typedInUsername },
                    set: { handle(action: .ui(.usernameTextChanged($0))) }
                )
            )
            .foregroundStyle(Color.ijLabel)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .focused($focused)
            .onAppear { focused = true }
        }
    }
    
    @ViewBuilder
    private var deleteButton: some View {
        switch model.submissionState {
        case .idle:
            Button(action: { handle(action: .ui(.deleteAccountTapped)) }) {
                Text("Delete My Account")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(model.isDeleteButtonDisabled ? Color.gray : Color.red)
                    .cornerRadius(8)
            }
            .disabled(model.isDeleteButtonDisabled)
            
        case .submitting:
            HStack {
                ProgressView()
                    .scaleEffect(0.8)
                Text("Deleting account...")
                    .font(.headline)
                    .foregroundStyle(Color.ijSecondaryLabel)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray)
            .cornerRadius(8)
            
        case .deleted:
            Text("Account deleted")
                .foregroundStyle(Color.ijLabel)
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
    
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
}
