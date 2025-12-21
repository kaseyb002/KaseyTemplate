import SwiftUI

public struct LoadingErrorView: View {
    private let error: Error
    private let didSelectRetry: () -> Void
    
    public var body: some View {
        LoadingResultScreen(
            template: .errorStyle(
                error: error,
                didSelectRetry: didSelectRetry
            ),
            bottomContent: {
                Button(action: {
                    NotificationCenter.default.post(Notification(name: .init("cry-for-help")))
                }) {
                    Text("Get help")
                        .foregroundStyle(Color.ijInteractive)
                        .padding()
                }
            }
        )
    }
    
    public init(
        error: Error,
        didSelectRetry: @escaping () -> Void
    ) {
        self.error = error
        self.didSelectRetry = didSelectRetry
    }
}
