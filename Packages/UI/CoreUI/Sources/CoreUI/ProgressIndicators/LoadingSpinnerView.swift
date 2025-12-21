import SwiftUI

public struct LoadingSpinnerView: View {
    public var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
    
    public init() {
        
    }
}
