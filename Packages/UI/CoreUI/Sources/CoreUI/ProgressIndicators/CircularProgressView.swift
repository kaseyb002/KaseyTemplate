import Colors
import SwiftUI

public struct CircularProgressView: View {
    private let progress: Double
    private let color: Color
    private let lineWidth: CGFloat
    
    public init(
        progress: Double,
        color: Color = .ijInteractive,
        lineWidth: CGFloat = 2
    ) {
        self.progress = progress
        self.color = color
        self.lineWidth = lineWidth
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.3),
                    lineWidth: lineWidth
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(
            progress: 0.7,
            lineWidth: 10
        ).frame(width: 100, height: 100)
    }
}
