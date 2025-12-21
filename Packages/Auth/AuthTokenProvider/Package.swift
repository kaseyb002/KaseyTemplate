// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthTokenProvider",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthTokenProvider",
            targets: ["AuthTokenProvider"]
        ),
    ],
    dependencies: [
        .package(name: "AuthModel", path: "../AuthModel"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(url: "https://github.com/kaseyb002/KaseyCodableStore", branch: "main"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", branch: "master"),
    ],
    targets: [
        .target(
            name: "AuthTokenProvider",
            dependencies: [
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "KaseyCodableStore", package: "KaseyCodableStore"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "AuthTokenProviderTests",
            dependencies: ["AuthTokenProvider"]
        ),
    ]
)
