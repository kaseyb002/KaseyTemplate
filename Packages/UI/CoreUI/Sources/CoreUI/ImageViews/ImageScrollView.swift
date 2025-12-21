import SwiftUI
import PDFKit

public struct ImageScrollView: UIViewRepresentable {
    public let image: UIImage

    public init(
        image: UIImage
    ) {
        self.image = image
    }

    public func makeUIView(context: Context) -> PDFView {
        let view: PDFView = .init()
        view.document = PDFDocument()
        guard let page: PDFPage = .init(image: image) else { return view }
        view.document?.insert(page, at: 0)
        view.autoScales = true
        return view
    }

    public func updateUIView(_ uiView: PDFView, context: Context) {
        // noop
    }
}
