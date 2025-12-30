import Foundation

extension HostAddress {
    public static func fake(
        displayName: String = "Prod",
        scheme: String = "https",
        host: String = "example.com",
        port: Int? = nil
    ) -> HostAddress {
        .init(
            displayName: displayName,
            scheme: scheme,
            host: host,
            port: port
        )
    }
}

