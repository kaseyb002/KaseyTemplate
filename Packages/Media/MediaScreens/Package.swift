// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MediaScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MediaScreens",
            targets: ["MediaScreens"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "ImageLoader", path: "../UI/ImageLoader"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(name: "MediaDataStore", path: "../MediaDataStore"),
        .package(name: "MediaModel", path: "../MediaModel"),
        .package(name: "MediaUI", path: "../MediaUI"),
        .package(name: "UtilityModel", path: "../UtilityModel/UtilityModel"),
        .package(url: "https://github.com/Giphy/giphy-ios-sdk", from: "2.2.16"),
    ],
    targets: [
        .target(
            name: "MediaScreens",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "GiphyUISDK", package: "giphy-ios-sdk"),
                .product(name: "ImageLoader", package: "ImageLoader"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaDataStore", package: "MediaDataStore"),
                .product(name: "MediaModel", package: "MediaModel"),
                .product(name: "MediaUI", package: "MediaUI"),
                .product(name: "UtilityModel", package: "UtilityModel"),
            ],
        ),
        .testTarget(
            name: "MediaScreensTests",
            dependencies: ["MediaScreens"]
        ),
    ]
)
