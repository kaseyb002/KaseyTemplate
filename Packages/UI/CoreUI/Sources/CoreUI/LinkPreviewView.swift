import LinkPresentation
import SwiftUI

public struct LinkPreviewView: View {
    let url: URL
    let maxSize: CGSize
    @State private var state: LoadingState = .idle
    @State private var task: Task<Void, Never>?
    
    public var body: some View {
        ZStack {
            switch state {
            case .idle, .loading:
                loadingView
                
            case .loaded(let metadata):
                previewView(metadata: metadata)
                
            case .error(let error):
                errorView(error: error)
            }
        }
        .animation(.default, value: state)
        .onChange(of: url) { _, newURL in
            fetchMetadataIfNeeded(url: newURL)
        }
        .task {
            fetchMetadataIfNeeded(url: url)
        }
    }
    
    public init(
        url: URL,
        maxSize: CGSize
    ) {
        self.url = url
        self.maxSize = maxSize
    }
}

// MARK: - Subviews
extension LinkPreviewView {
    private var loadingView: some View {
        ZStack {
            Color.clear
            LoadingSpinnerView()
        }
        .frame(
            minWidth: maxSize.width / 2,
            maxWidth: maxSize.width
        )
    }

    private func errorView(error: Error) -> some View {
        Text(url.absoluteString)
            .foregroundColor(Color.ijSecondaryLabel)
            .padding()
            .background(Color.ijSecondaryBackground, in: RoundedRectangle(cornerRadius: 20))
            .frame(maxWidth: 100)
    }
    
    private func previewView(metadata: LPLinkMetadata) -> some View {
        LinkPreviewRepresentable(
            metadata: metadata,
            maxSize: maxSize
        )
    }
}
    
// MARK: - Ops
extension LinkPreviewView {
    private func fetchMetadataIfNeeded(url: URL) {
        guard state.isLoaded == false else {
            return
        }
        task?.cancel()
        state = .loading
        task = Task {
            let provider: LPMetadataProvider = .init()
            do {
                let metadata: LPLinkMetadata = try await provider.startFetchingMetadata(for: url)
                await MainActor.run {
                    state = .loaded(metadata)
                }
            } catch {
                await MainActor.run {
                    state = .error(error)
                }
            }
        }
    }
    
    private enum LoadingState: Equatable {
        case idle
        case loading
        case loaded(LPLinkMetadata)
        case error(Error)
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.idle, .idle),
                 (.loading, .loading),
                 (.loaded, loaded),
                 (.error, .error):
                true
                
            default:
                false
            }
        }
        
        var isLoaded: Bool {
            switch self {
            case .idle, .loading, .error:
                false
                
            case .loaded:
                true
            }
        }
    }
    
    private struct FetchTask {
        let url: URL
        var task: Task<Void, Never>
    }
}

private struct LinkPreviewRepresentable: UIViewRepresentable {
    let metadata: LPLinkMetadata
    let maxSize: CGSize
    
    func makeUIView(context: Context) -> ConstrainedLPLinkView {
        let linkView = ConstrainedLPLinkView(
            maxSize: maxSize,
            metadata: metadata
        )
        return linkView
    }
    
    func updateUIView(_ uiView: ConstrainedLPLinkView, context: Context) {
        uiView.metadata = metadata
    }
}

private final class ConstrainedLPLinkView: LPLinkView {
    let maxSize: CGSize
    
    init(maxSize: CGSize, metadata: LPLinkMetadata) {
        self.maxSize = maxSize
        super.init(metadata: metadata)
    }

    override var intrinsicContentSize: CGSize {
        let originalSize = super.intrinsicContentSize
        let width = min(originalSize.width, maxSize.width)
        let height = min(originalSize.height, maxSize.width)
        return CGSize(width: width, height: height)
    }
}

#Preview {
    LinkPreviewView(
        url: URL(string: "https://www.apple.com")!,
        maxSize: CGSize(width: 200, height: 120)
    )
    .padding()
}
