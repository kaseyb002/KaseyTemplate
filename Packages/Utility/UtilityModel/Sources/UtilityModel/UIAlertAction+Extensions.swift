import UIKit

// MARK: - Extensions
extension UIAlertAction {
    public convenience init(
        title: String,
        style: UIAlertAction.Style = .default,
        image: UIImage? = nil,
        callback: @escaping () -> Void
    ) {
        self.init(title: title, style: style, handler: { _ in callback() })
        
        guard let image: UIImage else {
            return
        }
        
        let color: UIColor =
        switch style {
        case .default, .cancel:
                .systemBlue
        case .destructive:
                .systemRed
        @unknown default:
                .systemBlue
        }
        
        setValue(
            image.withTintColor(color, renderingMode: .alwaysOriginal),
            forKey: "image"
        )
    }
}
