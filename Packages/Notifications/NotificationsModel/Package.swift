// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "NotificationsModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NotificationsModel",
            targets: ["NotificationsModel"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "GroupModel", path: "../../Group/GroupModel"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "SampleData", path: "../../Utility/SampleData"),
        .package(name: "UserModel", path: "../../User/UserModel"),
    ],
    targets: [
        .target(
            name: "NotificationsModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "GroupModel", package: "GroupModel"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
                .product(name: "UserModel", package: "UserModel"),
            ],
        ),
        .testTarget(
            name: "NotificationsModelTests",
            dependencies: ["NotificationsModel"]
        ),
    ]
)
