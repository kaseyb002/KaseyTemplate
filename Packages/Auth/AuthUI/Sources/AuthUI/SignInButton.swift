import Colors
import SwiftUI

public struct SignInButton<Content: View>: View {
    private let didSelect: () -> Void
    private let content: Content
    private let backgroundColor: Color
    
    public var body: some View {
        if #available(iOS 26.0, *) {
            Button(action: didSelect) {
                content
                    .minimumScaleFactor(0.6)
                    .padding(.horizontal, 20)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .glassEffect(.regular.tint(backgroundColor.opacity(0.5)).interactive())
        } else {
            Button(action: didSelect) {
                content
                    .minimumScaleFactor(0.6)
                    .padding(.horizontal, 20)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(backgroundColor)
            }
            .clipShape(Capsule())
        }
    }
    
    public init(
        didSelect: @escaping () -> Void,
        backgroundColor: Color,
        @ViewBuilder content: () -> Content
    ) {
        self.didSelect = didSelect
        self.backgroundColor = backgroundColor
        self.content = content()
    }
}

#Preview {
    SignInButton(
        didSelect: {},
        backgroundColor: .black,
    ) {
        Text("Sign in baby")
            .foregroundStyle(.white)
    }
}
