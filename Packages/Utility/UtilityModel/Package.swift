// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UtilityModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UtilityModel",
            targets: ["UtilityModel"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Extensions"),
        .package(name: "Logger", path: "../Logger"),
        .package(name: "SampleData", path: "../../Assets/SampleData"),
    ],
    targets: [
        .target(
            name: "UtilityModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
            ],
        ),
        .testTarget(
            name: "UtilityModelTests",
            dependencies: ["UtilityModel"]
        ),
    ]
)
