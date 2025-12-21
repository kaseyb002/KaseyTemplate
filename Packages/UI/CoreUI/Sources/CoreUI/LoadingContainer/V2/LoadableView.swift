import SwiftUI

@MainActor
public protocol LoadableView: View {
    associatedtype Model
    associatedtype RequiredData
    associatedtype DataStore
    associatedtype Deps
    
    static func load(
        dataStore: DataStore,
        requiredData: RequiredData,
        isPresentedModally: Bool
    ) async throws -> Model
    
    @MainActor init(model: Model, deps: Deps)
}

extension LoadingView where Content: LoadableView, Model == Content.Model {
    @MainActor public init(
        requiredData: Content.RequiredData,
        deps: Content.Deps,
        dataStore: Content.DataStore,
        isPresentedModally: Bool
    ) {
        self.init(
            load: {
                try await Content.load(
                    dataStore: dataStore,
                    requiredData: requiredData,
                    isPresentedModally: isPresentedModally
                )
            },
            content: {
                Content(model: $0, deps: deps)
            }
        )
    }
}

extension CustomLoadingView where Content: LoadableView, Model == Content.Model {
    @MainActor public init(
        requiredData: Content.RequiredData,
        deps: Content.Deps,
        dataStore: Content.DataStore,
        loadingContent: @MainActor @Sendable @escaping () -> CustomLoadingContent,
        isPresentedModally: Bool,
        animation: Animation? = .default
    ) {
        self.init(
            load: {
                try await Content.load(
                    dataStore: dataStore,
                    requiredData: requiredData,
                    isPresentedModally: isPresentedModally
                )
            },
            content: {
                Content(model: $0, deps: deps)
            },
            loadingContent: loadingContent,
            animation: animation
        )
    }
}
