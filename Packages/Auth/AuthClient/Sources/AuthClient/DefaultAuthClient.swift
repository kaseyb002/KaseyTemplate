import AuthModel
import Extensions
import Foundation
import HTTP
import KaseyHTTP
import KeychainAccess

public final actor DefaultAuthClient: AuthClient {
    private let httpClient: HTTP.HTTPClient & Sendable
    private let decoder: JSONDecoder
    
    public init(
        httpClient: HTTP.HTTPClient & Sendable,
        decoder: JSONDecoder,
    ) {
        self.httpClient = httpClient
        self.decoder = decoder
    }
}

extension DefaultAuthClient {
    public func update(hostAddress: HostAddress) async {
        await httpClient.update(hostAddress: hostAddress)
    }
    
    public func hostAddress() async -> HostAddress {
        await httpClient.hostAddress
    }

    public func createAccount(
        email: String,
        password: String
    ) async throws -> TokenResponse {
        let request: CreateEmailAccountRequest = .init(
            emailAddress: email,
            password: password,
        )
        do {
            return try await httpClient.send(request)
        } catch let error as HTTPResponseError {
            struct EmailError: DisplayableError, Decodable {
                let email: [String]
                var displayableErrorTitle: String {
                    "Email error"
                }
                var displayableErrorMessage: String? {
                    email.joined(separator: " ")
                }
            }
            
            struct PasswordError: DisplayableError, Decodable {
                let password: [String]
                var displayableErrorTitle: String {
                    "Email error"
                }
                var displayableErrorMessage: String? {
                    password.joined(separator: " ")
                }
            }
            
            guard let data: Data = error.response.body else {
                throw error
            }
            if let emailError = try? decoder.decode(EmailError.self, from: data) {
                throw emailError
            } else if let passwordError = try? decoder.decode(PasswordError.self, from: data) {
                throw passwordError
            } else {
                throw error
            }
        } catch {
            throw error
        }
    }
    
    public func signIn(
        method: SignInMethod
    ) async throws -> TokenResponse {
        switch method {
        case .email(let username, let password):
            let request: ObtainTokenRequest = .init(
                username: username,
                password: password,
            )
            return try await httpClient.send(request)

        case .google(let token):
            let request: SignInWithGoogleRequest = .init(
                token: token,
            )
            let response: KeyResponse = try await httpClient.send(request)
            return TokenResponse(
                token: response.key,
                isNewAccount: response.isNew ?? false,
            )
            
        case .apple(let idToken, let accessToken, let name):
            let request: SignInWithAppleRequest = .init(
                idToken: idToken,
                accessToken: accessToken,
                name: name,
            )
            let response: KeyResponse = try await httpClient.send(request)
            return TokenResponse(
                token: response.key,
                isNewAccount: response.isNew ?? false,
            )
        }
    }
}
