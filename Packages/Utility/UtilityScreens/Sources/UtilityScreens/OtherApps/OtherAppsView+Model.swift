import Foundation
import UtilityModel

extension OtherAppsView {
    struct Model: Sendable {
        let otherApps: [OtherApp]
        let isPresentedModally: Bool
        
        init(
            otherApps: [OtherApp],
            isPresentedModally: Bool
        ) {
            self.otherApps = otherApps
            self.isPresentedModally = isPresentedModally
        }
    }
}
