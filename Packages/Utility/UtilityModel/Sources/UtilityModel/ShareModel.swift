import Foundation

public struct ShareModel: Sendable {
    public let activityItems: [any Sendable]
    
    public init(
        activityItems: [any Sendable]
    ) {
        self.activityItems = activityItems
    }
}
