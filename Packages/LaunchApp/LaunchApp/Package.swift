// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "LaunchApp",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "LaunchApp",
            targets: ["LaunchApp"]
        ),
    ],
    targets: [
        .target(
            name: "LaunchApp"
        ),
        .testTarget(
            name: "LaunchAppTests",
            dependencies: ["LaunchApp"]
        ),
    ]
)
