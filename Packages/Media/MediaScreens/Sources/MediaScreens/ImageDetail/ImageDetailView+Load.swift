import Foundation
import UIKit

extension ImageDetailView {
    static func load(
        dataStore: ImageDetailViewDataStore,
        requiredData: ImageDetailViewRequiredData,
        isPresentedModally: Bool
    ) async throws -> Model {
        async let imageType: ImageDetailView.Model.ImageType = {
            switch requiredData.imageSource {
            case .image(let image):
                return .image(image)
                
            case .url(let url):
                guard let url: URL else {
                    throw ImageDetailViewLoadError()
                }
                let uiImage: UIImage = try await dataStore.download(imageURL: url).image
                return .uiImage(uiImage)

            case .uiImage(let uiImage):
                return .uiImage(uiImage)
            }
        }()
        return try await Model(
            image: imageType
        )
    }
    
    private struct ImageDetailViewLoadError: Error {}
}
