import Combine
import Extensions
import Foundation
import KaseyCodableStore
import LocalSettingsModel

public protocol LocalSettingsDataStore: Actor, Sendable {
    nonisolated var didSaveSettings: AnyPublisher<LocalSettings, Never> { get }
    
    func onboardingPrompt<T>(
        _ keyPath: WritableKeyPath<OnboardingPrompts, T>,
    ) async throws -> T
    
    func save<T: Equatable>(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, T>,
        value: T,
    ) async throws
    
    func save(
        onboardingPrompt keyPath: WritableKeyPath<OnboardingPrompts, OnboardingPrompt>,
        hasPrompted: Bool,
    ) async throws
    
    func onboardingPrompts() async throws -> OnboardingPrompts
    
    func save<T: Equatable>(
        localSetting keyPath: WritableKeyPath<LocalSettings, T>,
        value: T,
    ) async throws

    func localSettingValue<T>(
        _ keyPath: KeyPath<LocalSettings, T>,
    ) async throws -> T
}
