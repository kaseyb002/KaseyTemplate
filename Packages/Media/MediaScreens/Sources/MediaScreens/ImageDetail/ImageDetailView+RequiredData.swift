import CoreUI
import UIKit

public struct ImageDetailViewRequiredData: Sendable {
    let imageSource: ImageSource
    
    public init(
        imageSource: ImageSource
    ) {
        self.imageSource = imageSource
    }
}
