import Foundation

public struct DebugURLHandlerViewRequiredData {
    let pushCount: Int
    let modalCount: Int
    
    public init(
        pushCount: Int,
        modalCount: Int
    ) {
        self.pushCount = pushCount
        self.modalCount = modalCount
    }
}
