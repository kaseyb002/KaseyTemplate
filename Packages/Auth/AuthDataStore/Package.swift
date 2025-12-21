// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthDataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthDataStore",
            targets: ["AuthDataStore"]
        ),
    ],
    dependencies: [
        .package(name: "AuthClient", path: "../AuthClient"),
        .package(name: "AuthModel", path: "../AuthModel"),
        .package(name: "AuthTokenProvider", path: "../AuthTokenProvider"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
    ],
    targets: [
        .target(
            name: "AuthDataStore",
            dependencies: [
                .product(name: "AuthClient", package: "AuthClient"),
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "AuthTokenProvider", package: "AuthTokenProvider"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "AuthDataStoreTests",
            dependencies: ["AuthDataStore"]
        ),
    ]
)
