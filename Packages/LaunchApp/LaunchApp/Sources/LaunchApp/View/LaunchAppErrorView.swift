import Foundation
import SwiftUI

struct LaunchAppErrorView: View {
    let handleAction: (Action) -> Void

    enum Action {
        case getHelpTapped
    }
    
    var body: some View {
        VStack(spacing: 30) {
            iconView
            titleLabel
            getHelpButton
        }
    }
}

// MARK: - Subviews
extension LaunchAppErrorView {
    private var iconView: some View {
        Image(systemName: "exclamationmark.triangle")
            .font(.system(size: 50))
            .foregroundStyle(Color.red)
    }

    private var titleLabel: some View {
        Text("Something went wrong")
            .font(.title)
            .bold()
    }
    
    private var getHelpButton: some View {
        Button(action: { handleAction(.getHelpTapped) }) {
            Text("Get help")
                .font(.title2)
        }
    }
}
