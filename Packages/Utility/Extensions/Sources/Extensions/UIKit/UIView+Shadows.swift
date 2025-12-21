import UIKit

extension UIView {
    public func addShadow(_ config: ShadowConfig = .init()) {
        layer.shadowColor = config.color.cgColor
        layer.shadowOffset = config.offset
        layer.shadowOpacity = config.opacity
        layer.shadowRadius = config.radius
        layer.masksToBounds = false
        clipsToBounds = false
    }
    
    public func removeShadow() {
        layer.shadowColor = nil
        layer.shadowOffset = .zero
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.0
    }
    
    public struct ShadowConfig {
        public var color: UIColor
        public var offset: CGSize
        public var opacity: Float
        public var radius: CGFloat
        
        public init(
            color: UIColor = .black,
            offset: CGSize = .zero,
            opacity: Float = 0.3,
            radius: CGFloat = 2
        ) {
            self.color = color
            self.offset = offset
            self.opacity = opacity
            self.radius = radius
        }
        
        public static var personCircle: ShadowConfig {
            .init(opacity: 0.35, radius: 2.5)
        }
        
        public static var smallPersonCircle: ShadowConfig {
            .init(opacity: 0.35, radius: 1)
        }
        
        public static var groupCircle: ShadowConfig {
            .init(opacity: 0.35, radius: 2.5)
        }
        
        public static var bigPodcastCover: ShadowConfig {
            .init(opacity: 0.6, radius: 8)
        }
        
        public static var podcastCover: ShadowConfig {
            .init()
        }
        
        public static var redDot: ShadowConfig {
            .init(opacity: 0.5, radius: 0.8)
        }
    }
}

