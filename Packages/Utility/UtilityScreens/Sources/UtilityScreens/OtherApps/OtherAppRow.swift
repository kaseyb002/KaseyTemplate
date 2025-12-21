import Colors
import CoreUI
import ImageAssets
import SwiftUI
import UtilityModel

struct OtherAppRow: View {
    let otherApp: OtherApp
    let handleEvent: (Event) -> Void
    
    enum Event: Equatable {
        case tapped
    }

    var body: some View {
        Button(action: { handleEvent(.tapped) }) {
            HStack {
                appIconImageView
                VStack {
                    titleLabel
                    descriptionLabel
                }
                goToAppStoreIconView
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Subviews
extension OtherAppRow {
    private var appIconImageView: some View {
        otherApp.id.appIcon
            .resizable()
            .aspectRatio(contentMode: .fill)
            .shadow(radius: 2)
            .frame(width: 60, height: 60)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var imagePlaceHolder: some View {
        Color.gray
    }
    
    private var titleLabel: some View {
        Text(otherApp.displayName)
            .font(.title3)
            .bold()
            .foregroundStyle(Color.ijLabel)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionLabel: some View {
        Text(otherApp.description)
            .foregroundStyle(Color.ijSecondaryLabel)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var goToAppStoreIconView: some View {
        Image(systemName: "rectangle.portrait.and.arrow.forward")
            .font(.system(size: 20))
            .foregroundStyle(Color.ijLabel)
    }
}

private extension OtherAppID {
    var appIcon: Image {
        switch self {
        case .gameNight:
            AppIconImage.gameNight.image
            
        case .noLimitHoldEm:
            AppIconImage.fourStraight.image
            
        case .fourStraight:
            AppIconImage.fourStraight.image
            
        case .stage10:
            AppIconImage.stage10.image
        }
    }
}
