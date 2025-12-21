import SwiftUI

extension View {
    public func tintedBackground(opacity: CGFloat = 0.35) -> some View {
        self
            .padding(5)
            .background(Color.black.opacity(opacity))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .clipShape(.rect(cornerRadii: .init(topLeading: 5, bottomLeading: 5, bottomTrailing: 5, topTrailing: 5)))
    }
}
