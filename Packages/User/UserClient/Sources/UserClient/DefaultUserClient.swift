import Foundation
import HTTP
import KaseyHTTP
import MediaClient
import UIKit
import UserModel

public final actor DefaultUserClient: UserClient {
    private let authedHTTPClient: any HTTP.HTTPClient
    private let mediaClient: any MediaClient

    public init(
        authedHTTPClient: any HTTP.HTTPClient,
        mediaClient: any MediaClient,
    ) {
        self.authedHTTPClient = authedHTTPClient
        self.mediaClient = mediaClient
    }
}

extension DefaultUserClient {
    public func myUser() async throws -> User {
        let request: MyUserRequest = .init()
        return try await authedHTTPClient.send(request)
    }
    
    public func update(username: String) async throws -> User {
        let request: UpdateUsernameRequest = .init(username: username)
        return try await authedHTTPClient.send(request)
    }
    
    public func validate(username: String) async throws -> ValidUsernameStatus {
        let clientStatus: ValidUsernameStatus = validateWithClientSideRules(username: username)
        guard clientStatus == .valid else {
            return clientStatus
        }
        let request: ValidateUsernameRequest = .init(username: username)
        return try await authedHTTPClient.send(request).status
    }
    
    private func validateWithClientSideRules(username: String) -> ValidUsernameStatus {
        // because i dont want to do it in python
        if username.isEmpty {
            return .empty
        }
        
        if username.contains(where: { $0.isValidTagCharacter == false }) {
            return .containsInvalidCharacters
        }
        
        if username.count > 20 {
            return .tooLong
        }
        
        if username.count < 3 {
            return .tooShort
        }
        
        return .valid
    }
    
    public func update(
        profileImage: UIImage
    ) async throws -> User {
        let url: URL = try await mediaClient.upload(image: profileImage)
        let request: UpdateProfileImageRequest = .init(url: url)
        return try await authedHTTPClient.send(request)
    }
    
    public func deleteAccount() async throws {
        let request: DeleteAccountRequest = .init()
        _ = try await authedHTTPClient.send(request)
    }
}

private extension Character {
    var isValidTagCharacter: Bool {
        if isLetter { return true }
        if isNumber { return true }
        if String(self) == "_" { return true }
        
        return false
    }
}
