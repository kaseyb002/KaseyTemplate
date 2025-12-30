import Colors
import CoreUI
import SwiftUI

struct HelpView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Form {
            Section {
                feedbackButton
            }

            if model.user != nil {
                Section {
                    signOutButton
                }
            }
            
            Section {
                debugMenuButton
            }
        }
        .scrollContentBackground(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButtonIfNeeded
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension HelpView {
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isModallyPresented {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
    
    private var signOutButton: some View {
        Button(
            role: .destructive,
            action: {
                handle(action: .ui(.signOutTapped))
            }) {
                Text("Sign out")
            }
            .listRowBackground(Color.ijSecondaryBackground)
    }
    
    private var feedbackButton: some View {
        ListNavigationButton(
            icon: Image(systemName: "lightbulb.fill"),
            iconColor: .purple,
            title: "Send feedback",
            didTap: {
                handle(action: .ui(.sendFeedbackTapped))
            }
        )
    }
    
    @ViewBuilder
    private var debugMenuButton: some View {
        if model.isDebugMenuEnabled {
            ListNavigationButton(
                icon: Image(systemName: "ladybug.fill"),
                iconColor: .pink,
                title: "Debug menu",
                didTap: {
                    handle(action: .ui(.debugMenuTapped))
                }
            )
        } else {
            Rectangle()
                .fill(Color.ijBackground)
                .frame(height: 100)
                .listRowBackground(Color.clear)
                .onTapGesture(count: 10) {
                    handle(action: .ui(.debugMenuEnabled))
                }
        }
    }
}
