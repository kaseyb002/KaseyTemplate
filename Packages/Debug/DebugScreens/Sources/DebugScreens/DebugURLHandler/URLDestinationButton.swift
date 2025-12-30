import Colors
import CoreUI
import SwiftUI

struct URLDestinationButton: View {
    let urlDestination: DebugURLHandlerView.Model.URLDestination
    let handleAction: (Action) -> Void
    
    enum Action {
        case tapped
        case copyToClipboardTapped
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                titleLabel
                urlLabel
            }
            copyToClipboardButton
            chevronView
        }
        .listRowBackground(Color.ijSecondaryBackground)
        .buttonStyle(.plain)
        .onTapGesture { handleAction(.tapped) }
    }
}

// MARK: - Subviews
extension URLDestinationButton {
    private var titleLabel: some View {
        Text(urlDestination.title)
            .foregroundStyle(Color.ijLabel)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
    
    private var urlLabel: some View {
        Text(urlDestination.url.absoluteString)
            .foregroundStyle(Color.ijSecondaryLabel)
            .font(.footnote)
            .truncationMode(.middle)
            .multilineTextAlignment(.leading)
    }
    
    private var copyToClipboardButton: some View {
        Button(action: { handleAction(.copyToClipboardTapped) }) {
            Image(systemName: "document.on.document")
                .font(.title2)
                .foregroundStyle(Color.ijInteractive)
        }
    }
    
    private var chevronView: some View {
        ChevronView()
    }
}
