// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "AuthScreens",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "AuthScreens",
            targets: ["AuthScreens"]
        ),
    ],
    dependencies: [
        .package(name: "AuthDataStore", path: "../AuthDataStore"),
        .package(name: "AuthModel", path: "../AuthModel"),
        .package(name: "AuthUI", path: "../AuthUI"),
        .package(name: "Colors", path: "../UI/Colors"),
        .package(name: "CoreUI", path: "../UI/CoreUI"),
        .package(name: "Extensions", path: "../Utility/Extensions"),
        .package(name: "HTTP", path: "../Utility/HTTP"),
        .package(name: "Logger", path: "../Utility/Logger"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0"),
    ],
    targets: [
        .target(
            name: "AuthScreens",
            dependencies: [
                .product(name: "AuthDataStore", package: "AuthDataStore"),
                .product(name: "AuthModel", package: "AuthModel"),
                .product(name: "AuthUI", package: "AuthUI"),
                .product(name: "Colors", package: "Colors"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "HTTP", package: "HTTP"),
                .product(name: "Logger", package: "Logger"),
            ],
        ),
        .testTarget(
            name: "AuthScreensTests",
            dependencies: ["AuthScreens"]
        ),
    ]
)
