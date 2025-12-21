import Colors
import SwiftUI

public struct ChevronView: View {
    private let direction: Direction
    private let font: Font
    private let foregroundColor: Color

    public enum Direction: String {
        case left, right, down, up
    }
    
    public var body: some View {
        Image(systemName: "chevron.\(direction.rawValue)")
            .font(font)
            .foregroundStyle(foregroundColor)
    }
    
    public init(
        direction: Direction = .right,
        font: Font = .footnote,
        foregroundColor: Color = .ijTertiaryLabel
    ) {
        self.direction = direction
        self.font = font
        self.foregroundColor = foregroundColor
    }
}
