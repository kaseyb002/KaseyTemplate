import Extensions
import SwiftUI

@MainActor
public struct LoadingView<Content: View, Model: Sendable>: View {
    @State private var state: LoadingState<Model> = .idle
    private let load: () async throws -> Model
    private let content: @MainActor (Model) -> Content

    public var body: some View {
        Group {
            switch state {
            case .idle:
                idleView
                
            case .loading:
                loadingView
                
            case .error(let error):
                errorView(error: error)
                
            case .loaded(let model):
                content(model)
            }
        }
        .animation(.linear(duration: 0.05), value: state.isError)
        .animation(.default, value: state.isLoaded)
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
        content: @MainActor @Sendable @escaping (Model) -> Content
    ) {
        self.load = load
        self.content = content
    }
}

// MARK: - Subviews
extension LoadingView {
    private var idleView: some View {
        Color.clear
            .onAppear(perform: loadModel)
    }
    
    private var loadingView: some View {
        DefaultLoadingScreen()
    }
    
    private func errorView(error: Error) -> some View {
        LoadingErrorView(
            error: error,
            didSelectRetry: loadModel
        )
    }
}
