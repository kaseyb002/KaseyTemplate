import CoreUI
import SwiftUI

struct ImageDetailView: LoadableView {
    @State var model: Model
    let deps: Deps
    
    var body: some View {
        Group {
            switch model.image {
            case .uiImage(let uiImage):
                uiImageView(uiImage: uiImage)
                
            case .image(let image):
                imageView(image: image)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                doneButton
            }
        }
        .subscribeToUpdates(subscribeToUpdates)
    }
    
    private func uiImageView(uiImage: UIImage) -> some View {
        ImageScrollView(image: uiImage)
    }
    
    private func imageView(image: Image) -> some View {
        ZoomScrollView(
            minZoom: 1,
            maxZoom: 6
        ) {
            image
                .resizable()
                .scaledToFit()
        }
    }
    
    private var doneButton: some View {
        CloseButton(didTap: {
            handle(action: .doneTapped)
        })
    }
}
