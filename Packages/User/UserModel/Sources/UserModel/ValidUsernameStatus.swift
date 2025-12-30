import Foundation

public enum ValidUsernameStatus: String, Equatable, Decodable, Sendable {
    case empty = "EMPTY"
    case usernameIsTaken = "USERNAME_TAKEN"
    case otherError = "OTHER_ERROR"
    case containsInvalidCharacters = "CONTAINS_INVALID_CHARACTERS"
    case tooLong = "TOO_LONG"
    case tooShort = "TOO_SHORT"
    case valid = "VALID"
}
