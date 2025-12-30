import Foundation
import Extensions

extension GroupError {
    public var displayableErrorTitle: String {
        switch self {
        case .playerNotFound:
            "Player was not found."
            
        case .groupNotFound:
            "Group was not found."
            
        case .noActiveHand:
            "No hand us currently being played."
            
        case .notYourTurn:
            "It is not your turn."
            
        case .notEnoughPlayers:
            "There are not enough players."
            
        case .inviteNotFound:
            "This invite code was not found."
            
        case .noRemainingAdmins:
            "There are no remaining hosts."
            
        case .noSeatsAvailable:
            "No seats remaining."
            
        case .notEnoughMoneyToPlay:
            "Not enough money"
            
        case .lacksPermission:
            "No permission"
            
        case .inviteAlreadyUsed:
            "Inviite already used"
            
        case .noChipAdjustingWhilePlayingHand:
            "Can't adjust chips while playing a hand"
        }
    }
    
    public var displayableErrorMessage: String? {
        switch self {
        case .playerNotFound:
            nil
            
        case .groupNotFound:
            nil
            
        case .noActiveHand:
            nil
            
        case .notYourTurn:
            nil
            
        case .notEnoughPlayers:
            nil
            
        case .inviteNotFound:
            "Please enter a different invite code or ask for a new one."
            
        case .noRemainingAdmins:
            "You'll first need to give someone else the ability to Edit Permissions."
        
        case .noSeatsAvailable:
            "You'll need to wait for someone to leave before you can sit."
            
        case .notEnoughMoneyToPlay(let bigBlind):
            "You need at least \(bigBlind.moneyString) to play a hand."
        
        case .lacksPermission(let requiredPermission):
            "You do not have permission to \(requiredPermission.displayValue.lowercased())."
            
        case .inviteAlreadyUsed:
            "This invite code has already been redeemed. You'll need a new one to join this group."
            
        case .noChipAdjustingWhilePlayingHand:
            "Wait until the current hand is over before trying to adjust chips. Make sure auto-deal is off."
        }
    }
}
