import Combine
import Colors
import CoreUI
import SwiftUI

struct EmailSignInView: LoadableView {
    @State var model: Model
    @FocusState private var focus: TextFieldFocus?
    @State private(set) var formChanged: PassthroughSubject<Model.Form, Never> = .init()
    let deps: Deps
    
    private enum TextFieldFocus {
        case email
        case password
    }

    var body: some View {
        VStack {
            switch model.state {
            case .incompleteForm, .formComplete, .error:
                signInForm
                
            case .signingIn, .creatingAccount:
                loadingView
                
            case .signedIn:
                successView
            }
        }
        .animation(.default, value: model.state)
        .onViewDidLoad { handle(action: .ui(.viewDidLoad)) }
        .subscribeToUpdates(subscribeToUpdates)
        .onChange(of: model.form) { _, newValue in
            formChanged.send(newValue)
        }
    }
    
    init(
        model: Model,
        deps: Deps
    ) {
        self.model = model
        self.deps = deps
    }
}

// MARK: - Form
extension EmailSignInView {
    private var signInForm: some View {
        ScrollView {
            VStack(spacing: 50) {
                VStack(spacing: 20) {
                    usernameField
                    passwordField
                }
                
                errorMessageIfNeeded
                
                VStack(spacing: 30) {
                    signInButton
                    createAccountButton
                    getHelpButton
                }
                .frame(maxWidth: 300)
            }
        }
        .contentMargins(20, for: .scrollContent)
    }
    
    private var usernameField: some View {
        TextField("Username or email", text: $model.form.username)
            .font(.title3)
            .bold()
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .focused($focus, equals: .email)
            .onAppear {
                focus = .email
            }
    }
    
    private var passwordField: some View {
        HStack {
            passwordTextField
            toggleShowPasswordButton
        }
    }
    
    @ViewBuilder
    private var passwordTextField: some View {
        Group {
            if model.isPasswordVisible {
                TextField("Password", text: $model.form.password)
            } else {
                SecureField("Password", text: $model.form.password)
            }
        }
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .focused($focus, equals: .password)
    }
    
    private var toggleShowPasswordButton: some View {
        Button(action: {
            handle(action: .ui(.passwordVisibleToggled))
        }) {
            Image(systemName: model.isPasswordVisible ? "eye.slash" : "eye")
                .foregroundColor(Color.ijSecondaryLabel)
                .contentTransition(.symbolEffect(.replace))
        }
    }
    
    @ViewBuilder
    private var errorMessageIfNeeded: some View {
        switch model.state {
        case let .error(message):
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text(message)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        default:
            EmptyView()
        }
    }
    
    private var signInButton: some View {
        PrimaryButton(title: "Sign in") {
            handle(action: .ui(.signInTapped))
        }
        .disabled(model.isSignInButtonDisabled)
    }
    
    private var createAccountButton: some View {
        Button(action: { handle(action: .ui(.createAccountTapped)) }) {
            Text("Create account")
                .bold()
                .foregroundStyle(Color.ijInteractive)
                .padding()
        }
        .disabled(model.isCreateAccountButtonDisabled)
    }
    
    private var getHelpButton: some View {
        Button(action: { handle(action: .ui(.getHelpTapped)) }) {
            HStack {
                Spacer()
                Text("Get help")
                    .foregroundStyle(Color.ijInteractive)
                Spacer()
            }
        }
    }
}

// MARK: - Loading
extension EmailSignInView {
    private var loadingView: some View {
        VStack {
            LoadingSpinnerView()
            Text(model.loadingText)
        }
    }
}

// MARK: - Success
extension EmailSignInView {
    private var successView: some View {
        VStack {
            Image(systemName: "checkmark.circle")
                .resizable()
                .foregroundColor(.ijInteractive)
                .frame(width: 150, height: 150)
            Text("Signed in")
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    EmailSignInView(
        model: .init(completion: { print($0) }),
        deps: .init(
            dataStore: FakeDataStore(),
            didSelectNavAction: { _ in },
        )
    )
}
