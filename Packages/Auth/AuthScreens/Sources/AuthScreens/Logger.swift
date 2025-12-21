import Foundation
import OSLog

public enum LogLevel: String, Equatable {
    case info
    case warning
    case error
    case debug
}

public func logIt(
    _ logLevel: LogLevel,
    _ message: String,
    error: Error? = nil
) {
    let logger = Logger(
        subsystem: "com.baughanapps.pokerface",
        category: logLevel.rawValue
    )

    switch logLevel {
    case .debug:
        logger.debug("\(message)")

    case .info:
        logger.info("\(message)")

    case .warning:
        logger.notice("\(message)")

    case .error:
        logger.error("\(message)")
    }
    
    if let error {
        logger.error("Error: \(String(describing: error))")
    }
}
