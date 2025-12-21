import SwiftUI

public struct DismissButton: View {
    public let didTap: () -> Void
    
    public var body: some View {
        Button(
            action: didTap
        ) {
            Image(systemName: "chevron.down")
                .foregroundStyle(Color.ijInteractive)
                .bold()
                .padding()
        }
        .buttonStyle(.plain)
    }
    
    public init(didTap: @escaping () -> Void) {
        self.didTap = didTap
    }
}
