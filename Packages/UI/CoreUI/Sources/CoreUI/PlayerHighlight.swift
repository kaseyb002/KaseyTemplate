import SwiftUI

public enum PlayerHighlight: Equatable {
    case isPlayersTurn(showPulsatingEffect: Bool)
    case isWinner
    
    public var isPlayersTurn: Bool {
        switch self {
        case .isPlayersTurn:
            true

        case .isWinner:
            false
        }
    }
    
    public var suggestedColor: Color {
        switch self {
        case .isPlayersTurn:
            .ijInteractive
            
        case .isWinner:
            .moneyGreen
        }
    }
}

extension PlayerHighlight? {
    public var suggestedColor: Color {
        self?.suggestedColor ?? .black
    }
}
