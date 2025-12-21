import UIKit

extension CGSize {
    /// Returns true if the shape is close enough to a circle that evenly-spaced ellipse seating is better than capsule-style edge positioning.
    public var isSpacingBetterForEllipseThanCapsule: Bool {
        let ratio = width / height
        if ratio > 2 {
            return false
        }
        if ratio < 0.8 {
            return false
        }
        return true
    }
    
    public var minOfWidthAndHeight: CGFloat {
        min(width, height)
    }
    
    public var resolution: CGFloat { width * height }
    
    public var aspectRatio: CGFloat { width / height }
    
    public func adjust(
        widthTo newWidth: CGFloat? = nil,
        heightTo newHeight: CGFloat? = nil
    ) -> Self {
        CGSize(width: newWidth ?? width, height: newHeight ?? height)
    }
    
    public func adjust(
        widthBy widthAmount: CGFloat = 0,
        heightBy heightAmount: CGFloat = 0
    ) -> Self {
        CGSize(width: width + widthAmount, height: height + heightAmount)
    }
}
