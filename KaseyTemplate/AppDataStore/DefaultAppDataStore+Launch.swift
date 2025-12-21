import Foundation

extension DefaultAppDataStore {
    func setupPreAppLaunch() async throws {
        
    }
    
    func appRequiredData() async throws -> LaunchAppRequiredData {
        .init(appName: "Kasey Template")
    }
    
    func setupPostAppLaunch() async throws {
        
    }
}
