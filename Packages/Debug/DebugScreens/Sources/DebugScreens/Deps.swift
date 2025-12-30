import Foundation
import SoundEffectPlayer

public struct Deps {
    let dataStore: DataStore
    let soundEffectPlayer: SoundEffectPlayer
    
    public init(
        dataStore: DataStore,
        soundEffectPlayer: SoundEffectPlayer
    ) {
        self.dataStore = dataStore
        self.soundEffectPlayer = soundEffectPlayer
    }
}
