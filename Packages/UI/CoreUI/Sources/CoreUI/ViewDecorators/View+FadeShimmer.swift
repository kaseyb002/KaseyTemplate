import SwiftUI

extension View {
    public func fadeShimmer(opacity: CGFloat = 0.4) -> some View {
        modifier(FadeShimerViewModifier(opacity: opacity))
    }
    
    public func redactedShimmer(
        opacity: CGFloat = 0.4,
        cornerRadius: CGFloat = 20
    ) -> some View {
        self
            .opacity(.zero)
            .accessibilityHidden(true)
            .allowsHitTesting(false)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.ijSecondaryBackground)
            }
            .fadeShimmer(opacity: opacity)
    }
}

private struct FadeShimerViewModifier: ViewModifier {
    @State private var isAnimating: Bool = false
    let opacity: CGFloat

    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? opacity : 1)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    isAnimating.toggle()
                }
            }
    }
}
