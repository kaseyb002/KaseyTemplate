import Combine
import Extensions
import Foundation
import KaseyCodableStore
import LocalSettingsModel

public final actor DefaultLocalSettingsDataStore: LocalSettingsDataStore {
    private nonisolated(unsafe) let didSaveSettingsSubject: PassthroughSubject<LocalSettings, Never> = .init()
    private let settingsFileStore: any CodableStore<LocalSettings>
    private let onboardingPromptsFileStore: any CodableStore<OnboardingPrompts>

    public init(
        settingsFileStore: any CodableStore<LocalSettings>,
        onboardingPromptsFileStore: any CodableStore<OnboardingPrompts>,
    ) {
        self.settingsFileStore = settingsFileStore
        self.onboardingPromptsFileStore = onboardingPromptsFileStore
    }
}

extension DefaultLocalSettingsDataStore {
    public nonisolated var didSaveSettings: AnyPublisher<LocalSettings, Never> {
        didSaveSettingsSubject.eraseToAnyPublisher()
    }

    public func onboardingPrompt<T>(
        _ keyPath: WritableKeyPath<OnboardingPrompts, T>,
    ) async throws -> T {
        let onboardingPrompts: OnboardingPrompts = try await onboardingPrompts()
        return onboardingPrompts[keyPath: keyPath]
    }
    
    public func save<T: Equatable>(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, T>,
        value: T,
    ) async throws {
        var onboardingPrompts: OnboardingPrompts = try await onboardingPrompts()
        onboardingPrompts[keyPath: keyPath] = value
        let updatedOnboardingPrompts: OnboardingPrompts = onboardingPrompts
        try await onboardingPromptsFileStore.save(object: updatedOnboardingPrompts)
    }
    
    public func save(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        hasPrompted: Bool,
    ) async throws {
        var onboardingPrompts: OnboardingPrompts = try await onboardingPrompts()
        if hasPrompted {
            onboardingPrompts[keyPath: keyPath].recordPrompt()
        } else {
            onboardingPrompts[keyPath: keyPath] = .init()
        }
        let updatedOnboardingPrompts: OnboardingPrompts = onboardingPrompts
        try await onboardingPromptsFileStore.save(object: updatedOnboardingPrompts)
    }
    
    public func onboardingPrompts() async throws -> OnboardingPrompts {
        (try? await onboardingPromptsFileStore.retrieve()) ?? .init()
    }
    
    public func save<T: Equatable>(
        localSetting keyPath: WritableKeyPath<LocalSettings, T>,
        value: T,
    ) async throws {
        var settings: LocalSettings = try await settings()
        settings[keyPath: keyPath] = value
        try await settingsFileStore.save(object: settings)
        didSaveSettingsSubject.send(settings)
    }
    
    public func localSettingValue<T>(
        _ keyPath: KeyPath<LocalSettings, T>,
    ) async throws -> T {
        try await settings()[keyPath: keyPath]
    }
    
    private func settings() async throws -> LocalSettings {
        (try? await settingsFileStore.retrieve()) ?? LocalSettings()
    }
}
