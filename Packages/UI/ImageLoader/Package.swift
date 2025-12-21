// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ImageLoader",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "ImageLoader",
            targets: ["ImageLoader"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(url: "https://github.com/kean/Nuke", branch: "main"),
    ],
    targets: [
        .target(
            name: "ImageLoader",
            dependencies: [
                .product(name: "Logger", package: "Logger"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .testTarget(
            name: "ImageLoaderTests",
            dependencies: ["ImageLoader"]
        ),
    ]
)

