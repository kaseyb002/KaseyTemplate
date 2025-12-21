import SwiftUI

public struct HighlightingBorderOverlayView: View {
    @State private var rotationProgress: Double = .zero
    private let shape: Shape
    private let lineWidth: CGFloat
    private let rotationDuration: TimeInterval

    public enum Shape {
        case circle
        case rectangle(cornerRadius: CGFloat)
    }

    public var body: some View {
        shapeView
            .onAppear {
                startRotating()
            }
            .onDisappear {
                stopRotating()
            }
    }
    
    public init(
        shape: Shape,
        lineWidth: CGFloat = 5,
        rotationDuration: TimeInterval = 5
    ) {
        self.shape = shape
        self.lineWidth = lineWidth
        self.rotationDuration = rotationDuration
    }
}

// MARK: - Subviews
extension HighlightingBorderOverlayView {
    @ViewBuilder
    private var shapeView: some View {
        switch shape {
        case .circle:
            Circle()
                .stroke(
                    gradient(rotation: rotationProgress),
                    lineWidth: lineWidth
                )
            
        case .rectangle(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(
                    gradient(rotation: rotationProgress),
                    lineWidth: lineWidth
                )
        }
    }
    
    private func gradient(rotation: Double) -> some ShapeStyle {
        AngularGradient(
            gradient: Gradient(colors: [
                Color.ijInteractive,
                Color.ijInteractive,
                Color.ijInteractive,
                Color.yellow,
                Color.ijInteractive,
                Color.ijInteractive,
                Color.ijInteractive,
            ]),
            center: .center,
            startAngle: .degrees(rotation * 360),
            endAngle: .degrees(rotation * 360 + 360)
        )
    }
}

// MARK: - Funcse
extension HighlightingBorderOverlayView {
    private func startRotating() {
        withAnimation(
            .linear(duration: rotationDuration).repeatForever(autoreverses: false)
        ) {
            rotationProgress = 1
        }
    }
    
    private func stopRotating() {
        withAnimation(
            .linear(duration: rotationDuration)
        ) {
            rotationProgress = .zero
        }
    }
}
