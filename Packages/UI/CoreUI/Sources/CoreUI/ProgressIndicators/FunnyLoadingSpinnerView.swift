import SwiftUI

public struct FunnyLoadingSpinnerView<SpinningView: View>: View {
    private let spinningView: SpinningView
    private let animation: Animation
    @State private var rotatedDegrees: CGFloat
    
    public enum Animation {
        case spin
        case wiggleBackAndForth
        
        var startingAngle: CGFloat {
            switch self {
            case .spin: 0
            case .wiggleBackAndForth: 45
            }
        }
    }

    public var body: some View {
        spinningView
            .rotationEffect(.degrees(rotatedDegrees))
            .onAppear { startAnimating() }
    }
    
    private func startAnimating() {
        switch animation {
        case .spin:
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                rotatedDegrees = 360
            }
            
        case .wiggleBackAndForth:
            withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                rotatedDegrees = -45
            }
        }
    }
    
    public init(
        animation: Animation,
        @ViewBuilder spinningView: () -> SpinningView
    ) {
        self.animation = animation
        self.rotatedDegrees = animation.startingAngle
        self.spinningView = spinningView()
    }
}
