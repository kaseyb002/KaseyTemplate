import SwiftUI

public struct ListNavigationIconView: View {
    private let icon: Image
    private let iconColor: Color
    
    public var body: some View {
        icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.white)
            .frame(width: 18, height: 18)
            .padding(4)
            .background(iconColor.gradient)
            .mask(RoundedRectangle(cornerRadius: 8))
    }
    
    public init(
        icon: Image,
        iconColor: Color
    ) {
        self.icon = icon
        self.iconColor = iconColor
    }
}
