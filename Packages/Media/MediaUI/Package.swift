// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MediaUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MediaUI",
            targets: ["MediaUI"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "MediaModel", path: "../MediaModel"),
        .package(url: "https://github.com/Giphy/giphy-ios-sdk", from: "2.2.16"),
    ],
    targets: [
        .target(
            name: "MediaUI",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "GiphyUISDK", package: "giphy-ios-sdk"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaModel", package: "MediaModel"),
            ],
        ),
        .testTarget(
            name: "MediaUITests",
            dependencies: ["MediaUI"]
        ),
    ]
)
