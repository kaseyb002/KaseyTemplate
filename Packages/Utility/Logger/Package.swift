// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Logger",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Extensions"),
    ],
    targets: [
        .target(
            name: "Logger",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
            ],
        ),
        .testTarget(
            name: "LoggerTests",
            dependencies: ["Logger"]
        ),
    ]
)
