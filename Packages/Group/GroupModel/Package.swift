// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "GroupModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "GroupModel",
            targets: ["GroupModel"]
        ),
    ],
    dependencies: [
        .package(name: "ChatModel", path: "../../Chat/ChatModel"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "SampleData", path: "../../Utility/SampleData"),
        .package(name: "UserModel", path: "../../User/UserModel"),
    ],
    targets: [
        .target(
            name: "GroupModel",
            dependencies: [
                .product(name: "ChatModel", package: "ChatModel"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
                .product(name: "UserModel", package: "UserModel"),
            ],
        ),
        .testTarget(
            name: "GroupModelTests",
            dependencies: ["GroupModel"]
        ),
    ]
)
