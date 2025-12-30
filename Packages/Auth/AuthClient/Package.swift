// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthClient",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthClient",
            targets: ["AuthClient"]
        ),
    ],
    dependencies: [
        .package(name: "AuthModel", path: "../AuthModel"),
        .package(name: "AuthTokenProvider", path: "../AuthTokenProvider"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "HTTP", path: "../Utility/HTTP"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "SampleData", path: "../Assets/SampleData"),
        .package(name: "Socket", path: "../Utility/Socket"),
        .package(url: "https://github.com/daltoniam/Starscream.git", branch: "master"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
    ],
    targets: [
        .target(
            name: "AuthClient",
            dependencies: [
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "AuthTokenProvider", package: "AuthTokenProvider"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "HTTP", package: "HTTP"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
                .product(name: "Socket", package: "Socket"),
                .product(name: "Starscream", package: "Starscream"),
            ],
        ),
        .testTarget(
            name: "AuthClientTests",
            dependencies: ["AuthClient"]
        ),
    ]
)
