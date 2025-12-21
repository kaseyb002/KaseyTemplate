// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MediaClient",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MediaClient",
            targets: ["MediaClient"]
        ),
    ],
    dependencies: [
        .package(name: "MediaModel", path: "../MediaModel"),
        .package(name: "HTTP", path: "../../Utility/HTTP"),
        .package(name: "ImageLoader", path: "../../UI/ImageLoader"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "1.0.0"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
    ],
    targets: [
        .target(
            name: "MediaClient",
            dependencies: [
                .product(name: "AWSS3", package: "aws-sdk-swift"),
                .product(name: "HTTP", package: "HTTP"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "ImageLoader", package: "ImageLoader"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaModel", package: "MediaModel"),
            ]
        ),
        .testTarget(
            name: "MediaClientTests",
            dependencies: ["MediaClient"]
        ),
    ]
)
