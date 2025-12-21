import Foundation

extension SignInMethod {
    public static func fake(
        username: String = "test@example.com",
        password: String = "password123"
    ) -> SignInMethod {
        .email(username: username, password: password)
    }
    
    public static func fakeGoogle(
        token: String = UUID().uuidString
    ) -> SignInMethod {
        .google(token: token)
    }
    
    public static func fakeApple(
        idToken: String = UUID().uuidString,
        accessToken: String = UUID().uuidString,
        name: PersonNameComponents? = nil
    ) -> SignInMethod {
        .apple(idToken: idToken, accessToken: accessToken, name: name)
    }
}

