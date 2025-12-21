import HUDKit
import UIKit

public final class HUD {
    public static func setup(keyWindow: UIWindow) {
        HUDKit.HUD.setup(keyWindow: keyWindow)
    }
}

public func showHUD(
    _ icon: UIImage? = nil,
    title: String? = nil,
    showSpinner: Bool = false,
    playHaptic: Bool = true,
    duration: TimeInterval? = 2.0
) {
    HUDKit.showHUD(
        icon,
        title: title,
        showSpinner: showSpinner,
        playHaptic: playHaptic,
        duration: duration
    )
}
