// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Colors",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Colors",
            targets: ["Colors"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Extensions"),
        .package(name: "Logger", path: "../Logger"),
    ],
    targets: [
        .target(
            name: "Colors",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "ColorsTests",
            dependencies: ["Colors"]
        ),
    ]
)
