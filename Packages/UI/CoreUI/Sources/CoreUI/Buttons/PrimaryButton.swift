import Colors
import SwiftUI

public struct PrimaryButton: View {
    private let title: String
    private let buttonRole: ButtonRole
    private let tintColor: Color
    private let didSelect: () -> Void
    
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
            Text(title)
                .foregroundStyle(Color.white)
                .bold()
                .padding()
        }
        .glassEffect(.regular.tint(tintColor.opacity(0.8)).interactive())
    }
    
    private var materialButton: some View {
        Button(role: buttonRole, action: didSelect) {
            Text(title)
                .foregroundStyle(Color.white)
                .bold()
                .padding()
        }
        .background(backgroundColor)
        .clipShape(Capsule())
        .shadow(radius: 1)
    }
    
    private var backgroundColor: Color {
        switch buttonRole {
        case .cancel:
            .ijInteractive
        
        case .destructive:
            .red
            
        default:
            .ijInteractive
        }
    }
    
    public init(
        title: String,
        role: ButtonRole = .cancel,
        tintColor: Color = .ijInteractive,
        didSelect: @escaping () -> Void
    ) {
        self.title = title
        self.buttonRole = role
        self.tintColor = tintColor
        self.didSelect = didSelect
    }
}

#Preview {
    VStack(spacing: 40) {
        PrimaryButton(
            title: "Call",
            didSelect: {}
        )
    }
}
