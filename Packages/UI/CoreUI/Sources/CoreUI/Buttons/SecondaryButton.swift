import SwiftUI

public struct SecondaryButton<Content: View>: View {
    private let didSelect: () -> Void
    private let content: Content
    private let buttonRole: ButtonRole
    
    public var body: some View {
        if #available(iOS 26.0, *) {
            glassButton
        } else {
            materialButton
        }
    }
    
    @available(iOS 26.0, *)
    private var glassButton: some View {
        Button(role: buttonRole, action: didSelect) {
            content
                .minimumScaleFactor(0.6)
                .padding()
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive())
    }
    
    private var materialButton: some View {
        Button(role: buttonRole, action: didSelect) {
            content
                .minimumScaleFactor(0.6)
                .padding()
                .background(.thickMaterial)
        }
        .buttonStyle(.plain)
        .clipShape(Capsule())
        .shadow(radius: 1)
    }
    
    public init(
        didSelect: @escaping () -> Void,
        @ViewBuilder content: () -> Content,
        role: ButtonRole = .cancel
    ) {
        self.didSelect = didSelect
        self.content = content()
        self.buttonRole = role
    }
}

#Preview {
    VStack(spacing: 40) {
        SecondaryButton(
            didSelect: {},
            content: { Text("Call").bold() }
        )
    }
}
