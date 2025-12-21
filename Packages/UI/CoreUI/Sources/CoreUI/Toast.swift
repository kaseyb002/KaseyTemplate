import ToastKit
import UIKit

public final class Toast {
    public static func setup(keyWindow: UIWindow) {
        ToastKit.Toast.setup(keyWindow: keyWindow)
    }
}

public func showToast(
    _ title: String,
    icon: UIImage? = nil,
    duration: TimeInterval = 1.5
) {
    ToastKit.showToast(
        title,
        icon: icon,
        duration: duration
    )
}
