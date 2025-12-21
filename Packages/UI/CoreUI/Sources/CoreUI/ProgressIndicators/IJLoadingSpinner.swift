import Colors
import SwiftUI

public struct IJLoadingSpinner: View {
    private let start: CGFloat
    private let duration: CGFloat
    @State private var shouldAnimate = false
    
    public init(
        start: CGFloat = 0.0,
        duration: CGFloat = 0.8,
        shouldAnimate: Bool = false
    ) {
        self.start = start
        self.duration = duration
        self.shouldAnimate = shouldAnimate
    }
    
    public var body: some View {
        Circle()
            .trim(from: start, to: start + 0.5) // Adjust the trim value to control the portion of the circle outline to be drawn
            .stroke(Color.ijInteractive.opacity(0.5), lineWidth: 2)
            .rotationEffect(.degrees(shouldAnimate ? 360 : 0))
            .animation(.linear(duration: duration).repeatForever(autoreverses: false), value: shouldAnimate)
            .onAppear {
                shouldAnimate = true
            }
    }
}
