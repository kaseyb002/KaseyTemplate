// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "HTTP",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "HTTP",
            targets: ["HTTP"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
    ],
    targets: [
        .target(
            name: "HTTP",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "HTTPTests",
            dependencies: ["HTTP"]
        ),
    ]
)
