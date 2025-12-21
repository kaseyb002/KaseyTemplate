import SwiftUI

extension View {
    public func onViewDidLoad(
        perform action: (() -> Void)? = nil
    ) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}

private struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
