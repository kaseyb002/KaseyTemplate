import NotificationsModel
import Colors
import CoreUI
import SwiftUI

struct PushNotificationAppActionButton: View {
    let pushNotificationAppAction: PushNotificationAppAction
    let tapped: () -> Void
    
    var body: some View {
        Button(action: tapped) {
            HStack {
                VStack(alignment: .leading) {
                    titleLabel
                    urlLabel
                }
                chevronView
            }
            .contentShape(Rectangle())
        }
        .listRowBackground(Color.ijSecondaryBackground)
        .buttonStyle(.plain)
    }
}

// MARK: - Subviews
extension PushNotificationAppActionButton {
    private var titleLabel: some View {
        Text(pushNotificationAppAction.displayTitle)
            .foregroundStyle(Color.ijLabel)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
    
    private var urlLabel: some View {
        Text(pushNotificationAppAction.logDescription)
            .foregroundStyle(Color.ijSecondaryLabel)
            .font(.footnote)
            .truncationMode(.middle)
            .multilineTextAlignment(.leading)
    }
    
    private var chevronView: some View {
        ChevronView()
    }
}
