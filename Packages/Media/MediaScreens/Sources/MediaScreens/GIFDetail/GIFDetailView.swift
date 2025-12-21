import MediaUI
import CoreUI
import SwiftUI

struct GIFDetailView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        VStack {
            AnimatedGifView(url: model.gifURL)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                closeButtonIfNeeded
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
}

// MARK: - Subviews
extension GIFDetailView {
    @ViewBuilder
    private var closeButtonIfNeeded: some View {
        if model.isPresentedModally {
            CloseButton(didTap: {
                handle(action: .ui(.closeTapped))
            })
        }
    }
}
