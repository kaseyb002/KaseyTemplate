// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "NotificationsClient",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NotificationsClient",
            targets: ["NotificationsClient"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "GroupModel", path: "../Group/GroupModel"),
        .package(name: "HTTP", path: "../Utility/HTTP"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "NotificationsModel", path: "../NotificationsModel"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
    ],
    targets: [
        .target(
            name: "NotificationsClient",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "GroupModel", package: "GroupModel"),
                .product(name: "HTTP", package: "HTTP"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "NotificationsModel", package: "NotificationsModel"),
            ],
        ),
        .testTarget(
            name: "NotificationsClientTests",
            dependencies: ["NotificationsClient"]
        ),
    ]
)
