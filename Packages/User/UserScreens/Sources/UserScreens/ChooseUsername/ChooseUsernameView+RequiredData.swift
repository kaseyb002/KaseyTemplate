import Foundation

public struct ChooseUsernameViewRequiredData {
    let navActionOnSuccess: NavAction
    
    public init(
        navActionOnSuccess: NavAction
    ) {
        self.navActionOnSuccess = navActionOnSuccess
    }
}
