import Foundation

extension Dictionary {
    public func findValues(byKeys keys: [Key]) -> [Value] {
        keys.compactMap { self[$0] }
    }
}
