// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "DebugUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "DebugUI",
            targets: ["DebugUI"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "DebugModel", path: "../DebugModel"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
    ],
    targets: [
        .target(
            name: "DebugUI",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "DebugModel", package: "DebugModel"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "DebugUITests",
            dependencies: ["DebugUI"]
        ),
    ]
)
