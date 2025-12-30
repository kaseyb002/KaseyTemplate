// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "NotificationsUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NotificationsUI",
            targets: ["NotificationsUI"]
        ),
    ],
    dependencies: [
        .package(name: "CoreUI", path: "../../Utility/CoreUI"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "NotificationsModel", path: "../NotificationsModel"),
        .package(url: "https://github.com/kean/Nuke", branch: "main"),
    ],
    targets: [
        .target(
            name: "NotificationsUI",
            dependencies: [
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "NotificationsModel", package: "NotificationsModel"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .testTarget(
            name: "NotificationsUITests",
            dependencies: ["NotificationsUI"]
        ),
    ]
)

