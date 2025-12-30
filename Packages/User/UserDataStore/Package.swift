// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UserDataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UserDataStore",
            targets: ["UserDataStore"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "UserClient", path: "../UserClient"),
        .package(name: "UserModel", path: "../UserModel"),
    ],
    targets: [
        .target(
            name: "UserDataStore",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "UserModel", package: "UserModel"),
                .product(name: "UserClient", package: "UserClient"),
            ]
        ),
        .testTarget(
            name: "UserDataStoreTests",
            dependencies: ["UserDataStore"]
        ),
    ]
)
