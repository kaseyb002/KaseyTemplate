import AuthUI
import Colors
import CoreUI
import SwiftUI

struct SignInToContinueView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 25) {
                headerLabel
                VStack {
                    signInButtons
                    errorLabelIfNeeded
                    getHelpButton
                    serverLabelIfNeeded
                }
            }
        }
        .contentMargins(10)
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButtonIfNeeded
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension SignInToContinueView {
    private var headerLabel: some View {
        Text(model.headerText)
            .font(.title)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
    }

    private var signInButtons: some View {
        VStack(
            spacing: 15
        ) {
            appleButton
            googleButton
            emailButton
        }
        .fixedSize(horizontal: true, vertical: false)
    }
    
    private var appleButton: some View {
        SignInButton(
            didSelect: {
                handle(action: .ui(.signInViaAppleTapped))
            },
            backgroundColor: Color.ijSecondaryBackground
        ) {
            HStack {
                Image(systemName: "apple.logo")
                Text("Sign in with Apple")
            }
            .font(.headline)
            .foregroundStyle(Color.ijLabel)
        }
    }
    
    private var googleButton: some View {
        SignInButton(
            didSelect: {
                handle(action: .ui(.signInViaGoogleTapped))
            },
            backgroundColor: Color.ijSecondaryBackground
        ) {
            HStack {
                Image(systemName: "g.circle.fill")
                Text("Sign in with Google")
            }
            .font(.headline)
            .foregroundStyle(Color.ijLabel)
        }
    }

    private var emailButton: some View {
        SignInButton(
            didSelect: {
                handle(action: .ui(.signUpViaEmailTapped))
            },
            backgroundColor: Color.ijSecondaryBackground,
            content: {
                HStack {
                    Image(systemName: "envelope")
                    Text("Sign in with email")
                }
                .font(.headline)
                .foregroundStyle(Color.ijLabel)
            }
        )
    }
    
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
    
    @ViewBuilder
    private var errorLabelIfNeeded: some View {
        if let error: Model.SignInError = model.signInError {
            Text(error.message)
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundStyle(Color.red)
        }
    }
    
    private var getHelpButton: some View {
        Button(action: { handle(action: .ui(.getHelpTapped)) }) {
            Text("Get help")
                .foregroundStyle(Color.ijInteractive)
                .padding()
        }
    }
    
    @ViewBuilder
    private var serverLabelIfNeeded: some View {
        if model.showServerLabel {
            SecondaryButton(didSelect: { handle(action: .ui(.serverTapped)) }) {
                HStack(spacing: 4) {
                    Image(systemName: "globe")
                    Text(model.serverName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(Color.ijLabel)
            }
        }
    }
}
