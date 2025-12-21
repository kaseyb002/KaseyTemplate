import SwiftUI

public struct PlayerAvatarStatusView: View {
    private let name: String
    private let subtitle: String
    private let imageSource: ImageSource
    private let isHighlighted: Bool
    private let avatarDiameter: CGFloat
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            playerAvatar
            playerInfoView
        }
    }
    
    public init(
        name: String,
        subtitle: String,
        imageSource: ImageSource,
        isHighlighted: Bool = false,
        avatarDiameter: CGFloat = 50
    ) {
        self.name = name
        self.subtitle = subtitle
        self.imageSource = imageSource
        self.isHighlighted = isHighlighted
        self.avatarDiameter = avatarDiameter
    }
}

// MARK: - Player
extension PlayerAvatarStatusView {
    private var playerInfoView: some View {
        VStack {
            nameLabel
            subtitleLabel
        }
        .padding(3)
        .background(
            infoColor.opacity(0.8).cornerRadius(5)
        )
    }
    
    private var infoColor: Color {
        isHighlighted ? .ijInteractive : .black
    }

    private var nameLabel: some View {
        Text("\(name)")
            .foregroundStyle(.white)
            .font(.footnote)
            .bold()
    }
    
    private var subtitleLabel: some View {
        Text(subtitle)
            .foregroundStyle(.white)
            .font(.footnote)
    }
    
    private var playerAvatar: some View {
        UserAvatarView(
            name: name,
            imageSource: imageSource
        )
        .frame(width: avatarDiameter, height: avatarDiameter)
        .background {
            if isHighlighted {
                PulsatingCircleView(
                    circleDiameter: avatarDiameter * 1.8
                )
            }
        }
        .offset(y: -(avatarDiameter * 0.4))
    }
}
