import Extensions
import Foundation
import SampleData

public enum ChatMessageClientID: Equatable, Decodable, Sendable {
    case id(ChatMessageID)
    case clientID(ChatMessageID)
    
    public var isFaked: Bool {
        switch self {
        case .id:
            false
            
        case .clientID:
            true
        }
    }
    
    public var exposedID: ChatMessageID {
        switch self {
        case .id(let chatMessageID):
            chatMessageID
            
        case .clientID(let chatMessageID):
            chatMessageID
        }
    }
}
