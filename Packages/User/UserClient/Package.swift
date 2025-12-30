// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "UserClient",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UserClient",
            targets: ["UserClient"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "HTTP", path: "../../Utility/HTTP"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "MediaClient", path: "../../Media/MediaClient"),
        .package(name: "UserModel", path: "../UserModel"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
    ],
    targets: [
        .target(
            name: "UserClient",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "HTTP", package: "HTTP"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "MediaClient", package: "MediaClient"),
                .product(name: "UserModel", package: "UserModel"),
            ]
        ),
        .testTarget(
            name: "UserClientTests",
            dependencies: ["UserClient"]
        ),
    ]
)
