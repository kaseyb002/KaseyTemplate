// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "LocalSettingsScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LocalSettingsScreens",
            targets: ["LocalSettingsScreens"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "LocalSettingsDataStore", path: "../LocalSettingsDataStore"),
        .package(name: "LocalSettingsModel", path: "../LocalSettingsModel"),
        .package(name: "LocalSettingsUI", path: "../LocalSettingsUI"),
        .package(name: "Logger", path: "../Utility/Logger"),
    ],
    targets: [
        .target(
            name: "LocalSettingsScreens",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "LocalSettingsDataStore", package: "LocalSettingsDataStore"),
                .product(name: "LocalSettingsModel", package: "LocalSettingsModel"),
                .product(name: "LocalSettingsUI", package: "LocalSettingsUI"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "LocalSettingsScreensTests",
            dependencies: ["LocalSettingsScreens"]
        ),
    ]
)
