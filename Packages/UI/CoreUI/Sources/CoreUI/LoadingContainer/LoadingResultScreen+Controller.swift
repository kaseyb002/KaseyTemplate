import Extensions
import KaseyHTTP
import SwiftUI

public struct LoadingResultScreenTemplate {
    public let icon: IconConfig?
    public let title: String?
    public let message: String?
    public let buttonConfig: ButtonConfig?
    
    public init(
        icon: LoadingResultScreenTemplate.IconConfig?,
        title: String? = nil,
        message: String?,
        buttonConfig: LoadingResultScreenTemplate.ButtonConfig?
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.buttonConfig = buttonConfig
    }
}

// MARK: - Templates
extension LoadingResultScreenTemplate {
    public static func emptyStyle(
        icon: IconConfig? = nil,
        message: String = "Nothing Found",
        buttonConfig: ButtonConfig?
    ) -> Self {
        .init(
            icon: icon,
            message: message,
            buttonConfig: buttonConfig
        )
    }
    
    public static func errorStyle(
        error: Error?,
        didSelectRetry: @escaping () -> Void
    ) -> Self {
        if let error = error as? HTTPError,
           error.code == .cannotConnect {
            return .offline(didSelectRetry: didSelectRetry)
        }
        
        let title: String
        let message: String?
        if let error = error as? DisplayableError {
            title = error.displayableErrorTitle
            message = error.displayableErrorMessage
        } else {
            title = "Something went wrong"
            message = error?.localizedDescription
        }
        return .init(
            icon: .error,
            title: title,
            message: message,
            buttonConfig: .retry(didSelect: didSelectRetry)
        )
    }
    
    public static func offline(
        didSelectRetry: @escaping () -> Void
    ) -> Self {
        .init(
            icon: .init(
                image: Image(systemName: "wifi.slash")
            ),
            title: "You're offline",
            message: nil,
            buttonConfig: .retry(didSelect: didSelectRetry)
        )
    }
}

// MARK: - Icon Config
extension LoadingResultScreenTemplate {
    public struct IconConfig {
        public let image: Image
        public let color: Color?
        
        public init(
            image: Image,
            color: Color = .primary
        ) {
            self.image = image
            self.color = color
        }
        
        public static var error: Self {
            .init(
                image: Image(systemName: "exclamationmark.triangle"),
                color: .red
            )
        }
        
        public static var offline: Self {
            .init(
                image: Image(systemName: "xmark.octagon"),
                color: Color.ijSeparator
            )
        }
    }
}

// MARK: - Button Config
extension LoadingResultScreenTemplate {
    public struct ButtonConfig {
        public let title: String
        public let didSelect: () -> Void
        
        public init(
            title: String,
            didSelect: @escaping () -> Void
        ) {
            self.title = title
            self.didSelect = didSelect
        }
        
        public static func retry(didSelect: @escaping () -> Void) -> Self {
            .init(
                title: "Retry",
                didSelect: didSelect
            )
        }
        
        public static func refresh(
            _ title: String = "Refresh",
            didSelect: @escaping () -> Void
        ) -> Self {
            .init(
                title: title,
                didSelect: didSelect
            )
        }
    }
}
