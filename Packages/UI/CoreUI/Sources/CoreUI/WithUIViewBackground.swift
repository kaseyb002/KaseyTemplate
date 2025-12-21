import SwiftUI

public struct WithUIViewBackground<Content: View>: View {
    let content: (UIView) -> Content
    // `@State` will ensure this view is only created once
    @State private var view = UIView()

    public init(
        @ViewBuilder content: @escaping (UIView) -> Content
    ) {
        self.content = content
    }

    public var body: some View {
        content(view)
            .background {
                /// Adding the `UIView` as a `.background` will ensure it lays out to the same size as the content
                ViewContainer(viewRequiringLayout: view)
            }
    }

    private struct ViewContainer: UIViewRepresentable {
        let viewRequiringLayout: UIView

        func makeUIView(context: Context) -> some UIView {
            viewRequiringLayout.tag = "WithUIViewBackground.ViewContainer".hash
            return viewRequiringLayout
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
}
