// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "SampleData",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "SampleData",
            targets: ["SampleData"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
    ],
    targets: [
        .target(
            name: "SampleData",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "SampleDataTests",
            dependencies: ["SampleData"]
        ),
    ]
)
