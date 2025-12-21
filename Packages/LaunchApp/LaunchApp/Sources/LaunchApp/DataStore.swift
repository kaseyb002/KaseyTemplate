import Foundation

public protocol DataStore<AppRequiredData>: Sendable where AppRequiredData: Sendable {
    associatedtype AppRequiredData
    
    /// Setup that *must* happen before the app can be launched.
    /// Whatever happens in here is blocking the launch of the app.
    func setupPreAppLaunch() async throws
    /// Data the app requires before it can launch.
    /// This also blocks the launch of the app until it is complete.
    func appRequiredData() async throws -> AppRequiredData
    /// Anything app setup that can wait post-lauch.
    /// Nothing in here blocks the launch of the app.
    func setupPostAppLaunch() async throws
}
