import Foundation

extension CreateAccountMethod {
    public static func fake(
        address: String = "test@example.com",
        password: String = "password123"
    ) -> CreateAccountMethod {
        .email(address: address, password: password)
    }
}

