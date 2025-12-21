import Extensions
import SwiftUI

@MainActor
public struct CustomLoadingView<
    Content: View,
    Model: Sendable,
    CustomLoadingContent: View
>: View {
    @State private var state: LoadingState<Model> = .idle
    private let load: @Sendable () async throws -> Model
    private let content: @MainActor @Sendable (Model) -> Content
    private let loadingContent: @MainActor @Sendable () -> CustomLoadingContent
    private let animation: Animation?

    public var body: some View {
        Group {
            switch state {
            case .idle:
                Color.clear
                    .onViewDidLoad(perform: loadModel)
                
            case .loading:
                loadingContent()
                
            case .error(let error):
                LoadingErrorView(
                    error: error,
                    didSelectRetry: loadModel
                )
                
            case .loaded(let model):
                content(model)
            }
        }
        .animation(.linear(duration: 0.05), value: state.isError)
        .animation(animation, value: state.isLoaded)
    }
    
    private func loadModel() {
        state = .loading
        Task {
            do {
                let model: Model = try await load()
                await MainActor.run {
                    state = .loaded(model)
                }
            } catch {
                await MainActor.run {
                    state = .error(error)
                }
            }
        }
    }
    
    public init(
        load: @MainActor @escaping () async throws -> Model,
        content: @MainActor @Sendable @escaping (Model) -> Content,
        loadingContent: @MainActor @Sendable @escaping () -> CustomLoadingContent,
        animation: Animation? = .default
    ) {
        self.load = load
        self.content = content
        self.loadingContent = loadingContent
        self.animation = animation
    }
}
