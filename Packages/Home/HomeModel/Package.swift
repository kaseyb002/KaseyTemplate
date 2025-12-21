// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "HomeModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "HomeModel",
            targets: ["HomeModel"]
        ),
    ],
    targets: [
        .target(
            name: "HomeModel"
        ),
        .testTarget(
            name: "HomeModelTests",
            dependencies: ["HomeModel"]
        ),
    ]
)
