import Colors
import CoreUI
import Extensions
import SwiftUI

struct TurnOnNotificationsPromptView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        VStack {
            titleLabel
            Spacer()
            turnOnNotificationsButton
            dismissButton
        }
        .padding([.horizontal, .bottom], 20)
        .onAppear {
            handle(action: .ui(.viewDidAppear))
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension TurnOnNotificationsPromptView {
    private var titleLabel: some View {
        Text("A good reason why you should turn on notifications")
            .font(.title)
            .multilineTextAlignment(.center)
            .bold()
            .foregroundStyle(Color.ijLabel)
            .offset(y: -20)
    }
    
    private var turnOnNotificationsButton: some View {
        Button(action: { handle(action: .ui(.turnOnNotificationsTapped)) }) {
            HStack {
                Spacer()
                Image(systemName: "bell")
                Text("Turn on notifications")
                    .font(.headline)
                    .bold()
                Spacer()
            }
            .foregroundColor(.white)
        }
        .padding(.vertical)
        .background(Color.ijInteractive)
        .cornerRadius(5)
        .frame(height: 50)
    }
    
    private var dismissButton: some View {
        Button(action: { handle(action: .ui(.dismissTapped)) }) {
            Text("Maybe later")
                .foregroundStyle(Color.ijInteractive)
                .padding()
        }
    }
}
