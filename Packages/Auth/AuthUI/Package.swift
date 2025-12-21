// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthUI",
            targets: ["AuthUI"]
        ),
    ],
    dependencies: [
        .package(name: "AuthModel", path: "../AuthModel"),
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
    ],
    targets: [
        .target(
            name: "AuthUI",
            dependencies: [
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "AuthUITests",
            dependencies: ["AuthUI"]
        ),
    ]
)
