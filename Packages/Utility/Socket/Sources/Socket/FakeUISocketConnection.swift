import Combine
import Foundation

public struct FakeUISocketConnection: UISocketConnection, @unchecked Sendable {
    public var urlRequest: URLRequest {
        .init(url: URL(string: "ws://google.com")!)
    }
    
    public var connectionStatus: CurrentValueSubject<SocketConnectionStatus, Never> = .init(.idle)
    
    public func disconnect() {
        
    }
    
    public init() {
        
    }
}
