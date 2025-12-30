@preconcurrency import Combine
import Foundation
import AuthDataStore
import AuthModel

struct DefaultAuthExternalDataStore: AuthExternalDataStore {
    func deleteStoredUser() async throws {
        // TODO
    }
    
    func deletePushRegistration() async throws {
        // TODO
    }
    
    func deleteCaches() async throws {
        // TODO
    }
    
    func registerForRemoteNotificationsIfAuthorizationHasBeenGranted() async throws {
        // TODO
    }
    
    // TODO
    var didDetectUnauthorized: AnyPublisher<Void, Never> = Empty().eraseToAnyPublisher()
}
