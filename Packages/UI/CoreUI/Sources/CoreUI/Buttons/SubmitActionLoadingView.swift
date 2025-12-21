import SwiftUI

public struct SubmitActionLoadingView: View {
    public var body: some View {
        HStack(spacing: 4) {
            heightMaintainingButton
            submittingLabel
            loadingSpinnerView
            heightMaintainingButton
        }
    }
    
    private var heightMaintainingButton: some View {
        SecondaryButton(didSelect: {}) {
            Text("null")
        }
        .opacity(.zero)
        .disabled(true)
    }
    
    private var submittingLabel: some View {
        Text("Submitting...")
            .foregroundStyle(Color.ijSecondaryLabel)
    }
    
    private var loadingSpinnerView: some View {
        LoadingSpinnerView()
    }
    
    public init() {
        
    }
}
