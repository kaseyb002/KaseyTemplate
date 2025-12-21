import Colors
import SwiftUI

public struct PulsatingCircleView: View {
    @State private var isAnimating: Bool = false
    private let animationDuration: TimeInterval = 1.5
    private let circleDiameter: CGFloat
    
    public var body: some View {
        Circle()
            .fill(Color.ijInteractive)
            .scaleEffect(isAnimating ? 1 : 0.01)
            .opacity(isAnimating ? 0 : 0.9)
            .frame(width: circleDiameter, height: circleDiameter)
            .animation(
                .easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
    
    public init(
        circleDiameter: CGFloat = 80
    ) {
        self.circleDiameter = circleDiameter
    }
}
