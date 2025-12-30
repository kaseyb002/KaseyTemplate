// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "LocalSettingsModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LocalSettingsModel",
            targets: ["LocalSettingsModel"]),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "SampleData", path: "../../Assets/SampleData"),
        .package(url: "https://github.com/kaseyb002/KaseyCodableStore", branch: "main"),
    ],
    targets: [
        .target(
            name: "LocalSettingsModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "KaseyCodableStore", package: "KaseyCodableStore"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
            ]
        ),
        .testTarget(
            name: "LocalSettingsModelTests",
            dependencies: ["LocalSettingsModel"]),
    ]
)
