import Foundation

struct ExponentialBackoffState: Equatable, Sendable {
    var reconnectAttempt: Int = 0
    var reconnectTask: Task<Void, Never>?
    let baseDelay: TimeInterval = 1.0
    let maxDelay: TimeInterval = 30.0
    let maxReconnectAttempts: Int = 10
    
    mutating func reset() {
        reconnectTask?.cancel()
        reconnectTask = nil
        reconnectAttempt = 0
    }
    
    var isMaxAttemptsExceeded: Bool {
        reconnectAttempt >= maxReconnectAttempts
    }
    
    func calculateDelay() -> TimeInterval {
        let exponentialDelay: TimeInterval = baseDelay * pow(2.0, Double(reconnectAttempt))
        let cappedDelay: TimeInterval = min(exponentialDelay, maxDelay)
        let jitter: TimeInterval = Double.random(in: 0...0.3) * cappedDelay
        let delay: TimeInterval = cappedDelay + jitter
        return delay
    }
}
