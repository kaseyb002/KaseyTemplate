// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "LocalSettingsDataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LocalSettingsDataStore",
            targets: ["LocalSettingsDataStore"]),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "LocalSettingsModel", path: "../LocalSettingsModel"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(url: "https://github.com/kaseyb002/KaseyCodableStore", branch: "main"),
    ],
    targets: [
        .target(
            name: "LocalSettingsDataStore",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "KaseyCodableStore", package: "KaseyCodableStore"),
                .product(name: "LocalSettingsModel", package: "LocalSettingsModel"),
                .product(name: "Logger", package: "Logger"),
            ]
        ),
        .testTarget(
            name: "LocalSettingsDataStoreTests",
            dependencies: ["LocalSettingsDataStore"]),
    ]
)
