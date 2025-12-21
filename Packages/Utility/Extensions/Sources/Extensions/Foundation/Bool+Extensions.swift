import Foundation

extension Bool {
    /// Probability should be between 0 and 1
    public static func random(withProbability probability: Float) -> Bool {
        probability > .random(in: 0...1)
    }
    
    public static var iOS26OrLater: Bool {
        #if os(iOS) && !targetEnvironment(macCatalyst)
        if #available(iOS 26.0, *) {
            return true
        } else {
            return false
        }
        #else
        return false
        #endif
    }
}
