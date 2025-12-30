// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "DebugScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "DebugScreens",
            targets: ["DebugScreens"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "DebugDataStore", path: "../DebugDataStore"),
        .package(name: "DebugModel", path: "../DebugModel"),
        .package(name: "DebugUI", path: "../DebugUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "UtilityModel", path: "../UtilityModel/UtilityModel"),
    ],
    targets: [
        .target(
            name: "DebugScreens",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "DebugDataStore", package: "DebugDataStore"),
                .product(name: "DebugModel", package: "DebugModel"),
                .product(name: "DebugUI", package: "DebugUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "UtilityModel", package: "UtilityModel"),
            ],
        ),
        .testTarget(
            name: "DebugScreensTests",
            dependencies: ["DebugScreens"]
        ),
    ]
)
