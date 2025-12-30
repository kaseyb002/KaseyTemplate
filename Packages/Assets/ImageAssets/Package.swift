// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ImageAssets",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "ImageAssets",
            targets: ["ImageAssets"]
        ),
    ],
    dependencies: [
        .package(name: "CoreUI", path: "../../UI/CoreUI"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
    ],
    targets: [
        .target(
            name: "ImageAssets",
            dependencies: [
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),

            ]
        ),
        .testTarget(
            name: "ImageAssetsTests",
            dependencies: ["ImageAssets"]
        ),
    ]
)
