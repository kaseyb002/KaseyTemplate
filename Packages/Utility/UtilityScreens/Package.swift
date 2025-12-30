// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UtilityScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UtilityScreens",
            targets: ["UtilityScreens"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../../UI/Colors"),
        .package(name: "CoreUI", path: "../../UI/CoreUI"),
        .package(name: "Extensions", path: "../Extensions"),
        .package(name: "ImageAssets", path: "../../Assets/ImageAssets"),
        .package(name: "ImageLoader", path: "../../UI/ImageLoader"),
        .package(name: "Logger", path: "../Logger"),
        .package(name: "UtilityModel", path: "../UtilityModel"),
    ],
    targets: [
        .target(
            name: "UtilityScreens",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "ImageAssets", package: "ImageAssets"),
                .product(name: "ImageLoader", package: "ImageLoader"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "UtilityModel", package: "UtilityModel"),
            ],
        ),
        .testTarget(
            name: "UtilityScreensTests",
            dependencies: ["UtilityScreens"]
        ),
    ]
)
