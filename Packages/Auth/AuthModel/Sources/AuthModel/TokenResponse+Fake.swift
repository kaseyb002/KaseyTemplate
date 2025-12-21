import Foundation

extension TokenResponse {
    public static func fake(
        token: String = UUID().uuidString,
        isNewAccount: Bool = false,
    ) -> TokenResponse {
        .init(
            token: token,
            isNewAccount: isNewAccount,
        )
    }
}
