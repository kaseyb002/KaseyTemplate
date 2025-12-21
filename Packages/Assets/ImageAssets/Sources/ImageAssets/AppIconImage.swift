import SwiftUI

public enum AppIconImage: String, Equatable, CaseIterable {
    case fourStraight
    case gameNight
    case noLimitHoldEm
    case stage10

    public var image: Image {
        switch self {
        case .fourStraight:
            Image(.AppIcons.fourStraight)
        case .gameNight:
            Image(.AppIcons.gameNight)
        case .noLimitHoldEm:
            Image(.AppIcons.noLimitHoldEm)
        case .stage10:
            Image(.AppIcons.stage10)
        }
    }
    
    public var uiImage: UIImage {
        switch self {
        case .fourStraight:
            UIImage(resource: .AppIcons.fourStraight)
        case .gameNight:
            UIImage(resource: .AppIcons.gameNight)
        case .noLimitHoldEm:
            UIImage(resource: .AppIcons.noLimitHoldEm)
        case .stage10:
            UIImage(resource: .AppIcons.stage10)
        }
    }
}
