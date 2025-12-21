import Foundation
import UtilityModel

public struct OtherAppsViewRequiredData: Sendable {
    let exclude: Set<OtherAppID>
    
    public init(
        exclude: Set<OtherAppID>
    ) {
        self.exclude = exclude
    }
}
