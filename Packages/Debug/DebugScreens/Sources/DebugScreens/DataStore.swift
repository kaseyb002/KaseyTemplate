import Foundation

public protocol DataStore:
    DebugMenuViewDataStore,
    DebugNetworkSettingsViewDataStore,
    DebugNotificationsViewDataStore,
    DebugURLHandlerViewDataStore,
    NoLimitHoldEmUIPlaygroundViewDataStore,
    OnboardingPromptsDebugViewDataStore,
    RateAppsViewDataStore,
    SoundEffectsViewDataStore,
    Stage10UIPlaygroundViewDataStore,
    UIPlaygroundViewDataStore,
    Actor,
    Sendable
{
    
}
