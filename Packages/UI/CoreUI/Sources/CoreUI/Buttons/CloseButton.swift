import SwiftUI

public struct CloseButton: View {
    public let didTap: () -> Void
    
    public var body: some View {
        if #available(iOS 26.0, *) {
            glassButton
        } else {
            solidButton
        }
    }
    
    @available(iOS 26.0, *)
    private var glassButton: some View {
        Button(
            action: didTap
        ) {
            Image(systemName: "xmark")
                .font(.footnote)
                .foregroundStyle(Color.ijLabel)
                .bold()
                .padding(10)
        }
    }
    
    private var solidButton: some View {
        Button(
            action: didTap
        ) {
            Image(systemName: "xmark")
                .font(.footnote)
                .foregroundStyle(Color.ijLabel)
                .bold()
                .padding(10)
                .background(.regularMaterial)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
    
    public init(didTap: @escaping () -> Void) {
        self.didTap = didTap
    }
}
