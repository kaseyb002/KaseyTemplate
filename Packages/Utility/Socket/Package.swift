// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Socket",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "Socket",
            targets: ["Socket"]
        ),
    ],
    dependencies: [
        .package(name: "AuthModel", path: "../../Auth/AuthModel"),
        .package(name: "AuthTokenProvider", path: "../../Auth/AuthTokenProvider"),
        .package(name: "Extensions", path: "../Extensions"),
        .package(name: "Logger", path: "../Logger"),
        .package(url: "https://github.com/daltoniam/Starscream.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "Socket",
            dependencies: [
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "AuthTokenProvider", package: "AuthTokenProvider"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "Starscream", package: "Starscream"),
            ]
        ),
        .testTarget(
            name: "SocketTests",
            dependencies: ["Socket"]
        ),
    ]
)

