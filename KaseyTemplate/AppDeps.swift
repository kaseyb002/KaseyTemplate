import Foundation

final class AppDeps {
    let dataStore: any AppDataStore
    
    init() {
        let appDataStore: DefaultAppDataStore = .init()
        self.dataStore = appDataStore
    }
}
