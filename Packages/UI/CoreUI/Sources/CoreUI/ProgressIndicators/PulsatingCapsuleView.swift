import Colors
import SwiftUI

public struct PulsatingCapsuleView: View {
    @State private var isAnimating: Bool = false
    private let animationDuration: TimeInterval = 1.5
    
    public var body: some View {
        Capsule()
            .fill(Color.ijInteractive)
            .scaleEffect(isAnimating ? 1.5 : 0.2)
            .opacity(isAnimating ? 0 : 0.9)
            .animation(
                .easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
    
    public init() {

    }
}
