import Extensions
import Foundation

public struct FakeSocketConnectionRequest: SocketConnectionRequest {
    public var path: String
    
    public init(
        path: String = "/fake/path",
    ) {
        self.path = path
    }
}
