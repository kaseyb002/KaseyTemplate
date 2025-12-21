import Foundation

extension Task where Success == Never, Failure == Never {
    /// Sleeps only in DEBUG builds
    public static func ifDebugSleep(for duration: ContinuousClock.Instant.Duration) async {
        #if DEBUG
//        #if targetEnvironment(simulator)
        try? await Task.sleep(for: duration)
//        #endif
        #endif
    }
}
