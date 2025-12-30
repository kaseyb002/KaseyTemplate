// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UserScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UserScreens",
            targets: ["UserScreens"]
        ),
    ],
    dependencies: [
        .package(name: "AuthModel", path: "../../Auth/AuthModel"),
        .package(name: "Colors", path: "../../UI/Colors"),
        .package(name: "CoreUI", path: "../../UI/CoreUI"),
        .package(name: "DebugModel", path: "../../Debug/DebugModel"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "LocalSettingsModel", path: "../../LocalSettings/LocalSettingsModel"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "MediaModel", path: "../../Media/MediaModel"),
        .package(name: "NotificationsModel", path: "../../Notifications/NotificationsModel"),
        .package(name: "NotificationsUI", path: "../../Notifications/NotificationsUI"),
        .package(name: "UserModel", path: "../UserModel"),
        .package(name: "UserUI", path: "../UserUI"),
        .package(name: "UtilityModel", path: "../../Utility/UtilityModel"),
    ],
    targets: [
        .target(
            name: "UserScreens",
            dependencies: [
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "DebugModel", package: "DebugModel"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "LocalSettingsModel", package: "LocalSettingsModel"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaModel", package: "MediaModel"),
                .product(name: "NotificationsModel", package: "NotificationsModel"),
                .product(name: "NotificationsUI", package: "NotificationsUI"),
                .product(name: "UserModel", package: "UserModel"),
                .product(name: "UserUI", package: "UserUI"),
                .product(name: "UtilityModel", package: "UtilityModel"),
            ]
        ),
        .testTarget(
            name: "UserScreensTests",
            dependencies: ["UserScreens"]
        ),
    ]
)
