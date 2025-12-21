import UIKit

extension UIEdgeInsets {
    public func adjust(
        topTo top: CGFloat? = nil,
        leftTo left: CGFloat? = nil,
        bottomTo bottom: CGFloat? = nil,
        rightTo right: CGFloat? = nil
    ) -> UIEdgeInsets {
        .init(
            top: top ?? self.top,
            left: left ?? self.left,
            bottom: bottom ?? self.bottom,
            right: right ?? self.right
        )
    }
    
    public static func allSides(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: amount,
            left: amount,
            bottom: amount,
            right: amount
        )
    }
    
    public static func top(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: amount,
            left: .zero,
            bottom: .zero,
            right: .zero
        )
    }
    
    public static func bottom(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: .zero,
            left: .zero,
            bottom: amount,
            right: .zero
        )
    }
    
    public static func left(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: .zero,
            left: amount,
            bottom: .zero,
            right: .zero
        )
    }
    
    public static func right(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: .zero,
            left: .zero,
            bottom: .zero,
            right: amount
        )
    }
    
    public static func vertical(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: amount,
            left: .zero,
            bottom: amount,
            right: .zero
        )
    }
    
    public static func horizontal(_ amount: CGFloat) -> UIEdgeInsets {
        .init(
            top: .zero,
            left: amount,
            bottom: .zero,
            right: amount
        )
    }
}
