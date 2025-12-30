// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "DebugDataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "DebugDataStore",
            targets: ["DebugDataStore"]
        ),
    ],
    dependencies: [
        .package(name: "DebugModel", path: "../DebugModel"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(url: "https://github.com/kaseyb002/KaseyCodableStore", branch: "main"),
    ],
    targets: [
        .target(
            name: "DebugDataStore",
            dependencies: [
                .product(name: "DebugModel", package: "DebugModel"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "KaseyCodableStore", package: "KaseyCodableStore"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "DebugDataStoreTests",
            dependencies: ["DebugDataStore"]
        ),
    ]
)
