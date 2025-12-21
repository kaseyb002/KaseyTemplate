// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Extensions",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Extensions",
            targets: ["Extensions"]
        ),
    ],
    targets: [
        .target(
            name: "Extensions"
        ),
        .testTarget(
            name: "ExtensionsTests",
            dependencies: ["Extensions"]
        ),
    ]
)
