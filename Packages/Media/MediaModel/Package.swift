// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "MediaModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "MediaModel",
            targets: ["MediaModel"]),
    ],
    dependencies: [
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "SampleData", path: "../../Assets/SampleData"),
    ],
    targets: [
        .target(
            name: "MediaModel",
            dependencies: [
                .product(name: "Logger", package: "Logger"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "SampleData", package: "SampleData"),
            ]
        ),
        .testTarget(
            name: "MediaModelTests",
            dependencies: ["MediaModel"]),
    ]
)
