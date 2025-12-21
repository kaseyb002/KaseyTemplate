import SwiftUI
import PDFKit

//public struct ImageScrollView: UIViewRepresentable {
//    public let image: UIImage
//
//    public init(
//        image: UIImage
//    ) {
//        self.image = image
//    }
//
//    public func makeUIView(context: Context) -> PDFView {
//        let view: PDFView = .init()
//        view.document = PDFDocument()
//        guard let page: PDFPage = .init(image: image) else { return view }
//        view.document?.insert(page, at: 0)
//        view.autoScales = true
//        view.backgroundColor = .ijBackground
//        return view
//    }
//
//    public func updateUIView(_ uiView: PDFView, context: Context) {
//        // noop
//    }
//}

import SwiftUI

public struct ImageScrollView: UIViewRepresentable {
    public let image: UIImage

    public func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.frame = scrollView.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        scrollView.addSubview(imageView)
        scrollView.delegate = context.coordinator
        context.coordinator.imageView = imageView
        return scrollView
    }

    public func updateUIView(_ uiView: UIScrollView, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public class Coordinator: NSObject, UIScrollViewDelegate {
        weak var imageView: UIImageView?

        public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
    }
}
