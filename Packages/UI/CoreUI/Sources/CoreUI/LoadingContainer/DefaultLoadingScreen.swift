import SwiftUI

public struct DefaultLoadingScreen: View {
    public let loadingTitle: String
    
    public init(_ customTitle: String? = nil) {
        self.loadingTitle = customTitle ?? "Loading"
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text(loadingTitle)
                .foregroundColor(.secondary)
            LoadingSpinnerView()
            Spacer()
        }
    }
}

#if DEBUG
struct DefaultLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        DefaultLoadingScreen()
    }
}
#endif
