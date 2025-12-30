import Foundation

extension LocalSettings {
    public static func fake(
        isSoundEffectsEnabled: Bool = false,
    ) -> LocalSettings {
        .init(
            isSoundEffectsEnabled: isSoundEffectsEnabled,
        )
    }
}
