import Foundation

public struct Deps {
    let dataStore: DataStore
    
    public init(
        dataStore: DataStore
    ) {
        self.dataStore = dataStore
    }
}
