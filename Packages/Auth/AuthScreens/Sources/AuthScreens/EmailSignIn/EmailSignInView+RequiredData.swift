import Foundation
import AuthModel

public struct EmailSignInViewRequiredData {
    let completion: @MainActor @Sendable (SignedInResult) -> Void

    public init(
        completion: @escaping @MainActor @Sendable (SignedInResult) -> Void,
    ) {
        self.completion = completion
    }
}
