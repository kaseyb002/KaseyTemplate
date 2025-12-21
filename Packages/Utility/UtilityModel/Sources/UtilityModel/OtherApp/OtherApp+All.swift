import Foundation

extension [OtherApp] {
    public static var all: [OtherApp] {
        [
            .gameNight,
            .noLimitHoldEm,
            .fourStraight,
            .stage10,
        ]
    }
}

extension OtherApp {
    public static var gameNight: OtherApp {
        .init(
            id: .gameNight,
            isSinglePlayer: false,
            displayName: "Game Night",
            description: "Play a variety of games with friends online.",
            appStoreURL: URL(string: "https://apps.apple.com/us/app/game-night-poker-w-friends/id6748957169")!
        )
    }
    
    public static var noLimitHoldEm: OtherApp {
        .init(
            id: .noLimitHoldEm,
            isSinglePlayer: true,
            displayName: "Offline Poker",
            description: "No Limit Texas Hold 'Em",
            appStoreURL: URL(string: "https://apps.apple.com/us/app/fast-hold-em-poker/id6748414132")!
        )
    }
    
    public static var fourStraight: OtherApp {
        .init(
            id: .fourStraight,
            isSinglePlayer: true,
            displayName: "Offline Four Straight",
            description: "Drop checkers to get four in a row.",
            appStoreURL: URL(string: "https://apps.apple.com/us/app/four-straight-offline/id6751903826")!
        )
    }
    
    public static var stage10: OtherApp {
        .init(
            id: .stage10,
            isSinglePlayer: true,
            displayName: "Offline Stage 10",
            description: "Complete 10 stages before your opponents do.",
            appStoreURL: URL(string: "https://apps.apple.com/us/app/offline-stage-10-card-game/id6754192960")!
        )
    }
}
