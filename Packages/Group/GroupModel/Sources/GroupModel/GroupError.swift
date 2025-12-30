import Extensions
import Foundation

public enum GroupError: DisplayableError {
    case playerNotFound
    case groupNotFound
    case noActiveHand
    case notYourTurn
    case notEnoughPlayers
    case inviteNotFound
    case inviteAlreadyUsed
    case noRemainingAdmins
    case noSeatsAvailable
    case notEnoughMoneyToPlay(bigBlind: Decimal)
    case lacksPermission(requiredPermission: GroupPermission)
    case noChipAdjustingWhilePlayingHand
}
