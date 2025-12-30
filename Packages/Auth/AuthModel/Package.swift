// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthModel",
            targets: ["AuthModel"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "SampleData", path: "../Assets/SampleData"),
    ],
    targets: [
        .target(
            name: "AuthModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
            ],
        ),
        .testTarget(
            name: "AuthModelTests",
            dependencies: ["AuthModel"]
        ),
    ]
)
