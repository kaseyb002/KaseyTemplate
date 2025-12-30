import Foundation
import UserModel

extension HelpView {
    struct Model: Sendable {
        let user: User?
        let isModallyPresented: Bool
        var isDebugMenuEnabled: Bool
    }
}
