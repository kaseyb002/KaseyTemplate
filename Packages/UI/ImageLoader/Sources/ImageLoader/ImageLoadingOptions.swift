import UIKit

public struct ImageLoadingOptions: Sendable {
    public var placeholder: UIImage?
    public var failureImage: UIImage?
    public var fadeIn: TimeInterval?
    public var resizeWidth: CGFloat?
    
    public init(
        placeholder: UIImage? = nil,
        failureImage: UIImage? = nil,
        fadeIn: TimeInterval? = 0.2,
        resizeWidth: CGFloat? = nil
    ) {
        self.placeholder = placeholder
        self.failureImage = failureImage
        self.fadeIn = fadeIn
        self.resizeWidth = resizeWidth
    }
    
    public static let `default` = ImageLoadingOptions()
}
