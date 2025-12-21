import AuthModel
import Foundation

public struct SignInToContinueViewRequiredData {
    let context: SignInToContinueContext
    
    public init(
        context: SignInToContinueContext
    ) {
        self.context = context
    }
}
