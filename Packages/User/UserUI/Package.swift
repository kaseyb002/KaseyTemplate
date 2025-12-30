// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UserUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UserUI",
            targets: ["UserUI"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "UserModel", path: "../UserModel"),
    ],
    targets: [
        .target(
            name: "UserUI",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "UserModel", package: "UserModel"),
            ],
        ),
        .testTarget(
            name: "UserUITests",
            dependencies: ["UserUI"]
        ),
    ]
)
