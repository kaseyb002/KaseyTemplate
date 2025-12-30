import AuthClient
import AuthDataStore
import AuthModel
import AuthScreens
import AuthTokenProvider
import Extensions
import Foundation
import HTTP
import KaseyCodableStore
import KaseyHTTP
import ImageLoader
import LaunchApp
import Logger
import MediaClient
import MediaDataStore
import MediaScreens
import NotificationsClient
import NotificationsDataStore
import UserClient
import UserDataStore
import UtilityScreens

final class AppDeps {
    let authScreensDeps: AuthScreens.Deps
    let dataStore: any AppDataStore
    let mediaScreensDeps: MediaScreens.Deps
    let utilityScreensDeps: UtilityScreens.Deps
    
    init() {
        var timeTracker: TimeTracker = .init(operation: "AppDeps.init()")
        defer {
            timeTracker.endTracking(.success)
            logIt(.info, "🚀 \(timeTracker.timeElapsedLogValue)")
        }
        let jsonDecoder: JSONDecoder = .init()
        jsonDecoder.dateDecodingStrategy = .iso8601
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonEncoder: JSONEncoder = .init()
        jsonEncoder.dateEncodingStrategy = .iso8601
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        let savedTokenEventFileStore: JSONFileManagerCodableStore<SavedTokenEvent> = .init(
            fileName: .savedTokenEvent,
        )
        let authTokenProvider: DefaultAuthTokenProvider = .init(
            serviceKey: "com.baughanapps.KaseyTemplate", // TODO: replace
            tokenKey: "auth-api-token",
            savedTokenEventFileStore: savedTokenEventFileStore,
        )
        let httpClient: KaseyHTTP.HTTPClient = URLSession.shared
        let httpHostAddress: HostAddress = .init(
            displayName: "Local Dev",
            scheme: "http",
            host: "127.0.0.1",
            port: 8000,
        )
        let socketHostAddress: HostAddress = .init(
            displayName: "Local Dev",
            scheme: "ws",
            host: "127.0.0.1",
            port: 8000,
        )
        let unauthedHTTPClient: UnauthedHTTPClient = .init(
            hostAddress: httpHostAddress,
            httpClient: httpClient,
            jsonDecoder: jsonDecoder,
        )
        let authedHTTPClient: AuthedHTTPClient = .init(
            httpClient: httpClient,
            authTokenProvider: authTokenProvider,
            hostAddress: httpHostAddress,
            jsonDecoder: jsonDecoder,
        )
        let unauthedSOcket
        let notificationsClient: DefaultNotificationsClient = .init(
            authedHTTPClient: authedHTTPClient,
            encoder: jsonEncoder,
        )
        let notificationsDataStore: DefaultNotificationsDataStore = .init(
            client: notificationsClient,
        )
        let authClient: DefaultAuthClient = .init(
            httpClient: unauthedHTTPClient,
            decoder: jsonDecoder,
        )
        let authExternalDataStore: DefaultAuthExternalDataStore = .init()
        let authDataStore: DefaultAuthDataStore = .init(
            client: authClient,
            authTokenProvider: authTokenProvider,
            externalStore: authExternalDataStore,
        )
        let imageLoader: DefaultImageLoader = .init()
        let mediaClient: DefaultMediaClient = .init(
            httpClient: authedHTTPClient,
            imageLoader: imageLoader,
            encoder: jsonEncoder,
        )
        let mediaDataStore: DefaultMediaDataStore = .init(
            client: mediaClient,
        )
        let mediaScreensDataStore: MediaScreens.DefaultDataStore = .init(
            imageLoader: imageLoader,
        )
        let userClient: DefaultUserClient = .init(
            authedHTTPClient: authedHTTPClient,
            mediaClient: mediaClient,
        )
        let appDataStore: DefaultAppDataStore = .init()
        self.dataStore = appDataStore
        self.mediaScreensDeps = .init(
            dataStore: mediaScreensDataStore,
        )
        let authScreensDataStore: AuthScreens.DefaultDataStore = .init(
            authDataStore: authDataStore,
        )
        self.authScreensDeps = .init(
            dataStore: authScreensDataStore,
        )
        let utilityScreensDataStore: UtilityScreens.DefaultDataStore = .init()
        self.utilityScreensDeps = .init(
            dataStore: utilityScreensDataStore,
        )
    }
    
    enum FileName: String {
        case cachedUser
        case onboardingPrompts
        case localSettings
        case debugConfig
        case savedTokenEvent
    }
}

private extension JSONFileManagerCodableStore {
    init(fileName: AppDeps.FileName) {
        self.init(fileName: fileName.rawValue)
    }
}
