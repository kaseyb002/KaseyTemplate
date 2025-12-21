import SwiftUI

public struct PowerButton: View {
    private let title: String
    private let didSelect: () -> Void
    
    public var body: some View {
        Button(action: didSelect) {
            Text(title)
                .foregroundStyle(.white)
                .bold()
                .padding()
        }
        .background(Color.green)
        .clipShape(Capsule())
    }
    
    
    public init(
        title: String,
        didSelect: @escaping () -> Void
    ) {
        self.title = title
        self.didSelect = didSelect
    }
}

#Preview {
    VStack(spacing: 40) {
        PowerButton(
            title: "Call",
            didSelect: {}
        )
    }
}
