import Foundation

public struct TimeTracker: Sendable {
    public let operation: String
    public let startTime: CFAbsoluteTime
    public var end: End?
    
    public struct End: Sendable {
        public let time: CFAbsoluteTime
        public let result: Result

        public enum Result: Sendable {
            case success
            case failure
        }
    }
    
    public mutating func endTracking(_ result: End.Result) {
        end = End(
            time: CFAbsoluteTimeGetCurrent(),
            result: result,
        )
    }
    
    public var elapsedMilliseconds: Int? {
        guard let endTime: CFAbsoluteTime = end?.time else {
            return nil
        }
        let elapsed = endTime - startTime
        return Int(elapsed * 1000)
    }
    
    /// e.g., "500 ms"
    public var elapsedMillisecondsLogValue: String {
        guard let elapsedMilliseconds: Int else {
            return "Not finished"
        }
        
        return "\(elapsedMilliseconds) ms"
    }
    
    /// e.g., "500 ms - Operation Delta"
    public var timeElapsedLogValue: String {
        var text: String = "\(elapsedMillisecondsLogValue) - \(operation)"
        if end?.result == .failure {
            text += " - FAILED"
        }
        return text
    }
    
    public init(
        operation: String
    ) {
        self.operation = operation
        self.startTime = CFAbsoluteTimeGetCurrent()
    }
}
