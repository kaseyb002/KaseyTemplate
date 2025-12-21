import SwiftUI

public struct ZoomScrollView<Content: View>: UIViewRepresentable {
    public let content: Content
    public var minZoom: CGFloat = 1.0
    public var maxZoom: CGFloat = 5.0

    public init(minZoom: CGFloat = 1.0,
                maxZoom: CGFloat = 5.0,
                @ViewBuilder content: () -> Content) {
        self.content = content()
        self.minZoom = minZoom
        self.maxZoom = maxZoom
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeUIView(context: Context) -> UIScrollView {
        let scroll = UIScrollView()
        scroll.minimumZoomScale = minZoom
        scroll.maximumZoomScale = maxZoom
        scroll.bouncesZoom = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .clear
        scroll.delegate = context.coordinator

        // Host SwiftUI content inside the scroll view
        let host = UIHostingController(rootView: content)
        host.view.backgroundColor = .clear
        host.view.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(host.view)

        // Pin hosted view to the scroll view’s content layout guides
        NSLayoutConstraint.activate([
            host.view.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: scroll.contentLayoutGuide.trailingAnchor),
            host.view.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor),

            // Make the hosted view track the scroll view’s frame width/height
            host.view.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor),
            host.view.heightAnchor.constraint(equalTo: scroll.frameLayoutGuide.heightAnchor)
        ])

        context.coordinator.hostView = host.view
        return scroll
    }

    public func updateUIView(_ uiView: UIScrollView, context: Context) {
        // Nothing needed — SwiftUI will re-render the hosted content
    }

    public class Coordinator: NSObject, UIScrollViewDelegate {
        weak var hostView: UIView?
        public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            hostView
        }
    }
}
