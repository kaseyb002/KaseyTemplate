import AuthModel
import Foundation
import KaseyHTTP
import HTTP

struct SignInWithAppleRequest: HTTP.HTTPRequest {
    typealias ResponseType = KeyResponse

    let path: String = "/auth/apple"
    let idToken: String
    let accessToken: String
    let name: PersonNameComponents?
    let method: HTTPMethod = .post

    var body: (any HTTPBody)? {
        var params: [String: String] = [
            "id_token": idToken,
            "access_token": accessToken
        ]
        if let name: PersonNameComponents {
            params["name"] = name.formattedFullName
        }
        return JSONBody(params)
    }
}

private extension PersonNameComponents {
    var formattedFullName: String {
        var components: [String] = []
        if let given = givenName, !given.isEmpty {
            components.append(given)
        }
        if let middle = middleName, !middle.isEmpty {
            components.append(middle)
        }
        if let family = familyName, !family.isEmpty {
            components.append(family)
        }
        return components.joined(separator: " ")
    }
}
