// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ChatModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "ChatModel",
            targets: ["ChatModel"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "MediaModel", path: "../Media/MediaModel"),
        .package(name: "SampleData", path: "../Assets/SampleData"),
        .package(name: "UserModel", path: "../../User/UserModel"),
    ],
    targets: [
        .target(
            name: "ChatModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaModel", package: "MediaModel"),
                .product(name: "SampleData", package: "SampleData"),
                .product(name: "UserModel", package: "UserModel"),
            ]
        ),
        .testTarget(
            name: "ChatModelTests",
            dependencies: ["ChatModel"]
        ),
    ]
)

