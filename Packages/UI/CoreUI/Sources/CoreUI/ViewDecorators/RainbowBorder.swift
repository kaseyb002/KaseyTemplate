import SwiftUI

extension View {
    public func rainbowBorder(
        lineWidth: CGFloat = 5,
        cornerRadius: CGFloat = 5
    ) -> some View {
        overlay {
            RoundedRectangle(cornerRadius: lineWidth)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color.red,
                            Color.orange,
                            Color.yellow,
                            Color.green,
                            Color.blue,
                            Color.indigo,
                            Color.purple,
                            Color.red,
                        ]),
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        dash: []
                    )
                )
        }
    }
}
