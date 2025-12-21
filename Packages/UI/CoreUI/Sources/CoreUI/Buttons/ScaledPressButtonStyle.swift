import SwiftUI

public struct ScaledPressButtonStyle: ButtonStyle {
    public func makeBody(
        configuration: Self.Configuration
    ) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.90 : 1)
            .animation(.snappy, value: configuration.isPressed)
    }
}
