import Foundation
import Extensions

public struct User: Hashable, Codable, Sendable {
    public let id: UserID
    public var username: String
    public var email: String
    public var dateJoined: Date
    public var account: Account?
    
    public init(
        id: UserID,
        username: String,
        email: String,
        dateJoined: Date,
        account: Account?,
    ) {
        self.id = id
        self.username = username
        self.email = email
        self.dateJoined = dateJoined
        self.account = account
    }
}
