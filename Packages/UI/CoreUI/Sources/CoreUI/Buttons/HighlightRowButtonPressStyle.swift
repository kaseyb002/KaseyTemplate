import SwiftUI

public struct HighlightRowButtonPressStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                configuration.isPressed ? Color.ijSecondaryBackground.opacity(0.5) : Color.ijSecondaryBackground
            }
    }
    
    public init() {}
}
