import Extensions
import Foundation
import Starscream

extension SocketConnection {
    public static func fake() -> SocketConnection {
        .init(
            urlRequest: .init(url: URL(string: "ws://google.com")!),
            decoder: JSONDecoder(),
            socket: .init(
                request: .init(
                    url: .fakeImageURL
                )
            )
        )
    }
}
