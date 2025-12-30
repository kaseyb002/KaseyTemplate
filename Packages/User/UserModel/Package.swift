// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UserModel",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UserModel",
            targets: ["UserModel"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "SampleData", path: "../../Assets/SampleData"),
    ],
    targets: [
        .target(
            name: "UserModel",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "SampleData", package: "SampleData"),
            ],
        ),
        .testTarget(
            name: "UserModelTests",
            dependencies: ["UserModel"]
        ),
    ]
)
