import SwiftUI
import WebKit

public struct GIFView: UIViewRepresentable {
    private let gifPath: String?
    
    public init(gifPath: String?) {
        self.gifPath = gifPath
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isUserInteractionEnabled = false
        webView.isOpaque = false
        webView.scrollView.backgroundColor = .clear
        webView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false

        if let gifPath: String {
            let data = try? Data(contentsOf: URL(fileURLWithPath: gifPath))
            webView.load(
                data!,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: URL(fileURLWithPath: gifPath)
            )
        }

        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {}
}
