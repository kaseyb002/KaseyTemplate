import Foundation

public enum SignInMethod: Sendable {
    case email(username: String, password: String)
    case google(token: String)
    case apple(idToken: String, accessToken: String, name: PersonNameComponents?)
}
