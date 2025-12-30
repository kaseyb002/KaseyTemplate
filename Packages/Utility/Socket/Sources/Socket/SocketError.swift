import Foundation

public enum SocketError: Error {
    case missingURL
    case socketPrematurelyDeallocated
}
