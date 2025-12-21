import SwiftUI

public enum Colors {
    
    @MainActor
    public static var theme: Theme = .dude
    
    public enum Theme: Equatable {
        case dude
        case ralph
    }
}
