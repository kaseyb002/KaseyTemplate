// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"]
        ),
    ],
    dependencies: [
        .package(name: "Colors", path: "../Colors"),
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(url: "https://github.com/kaseyb002/HUDKit-ios", branch: "main"),
        .package(url: "https://github.com/kaseyb002/KaseyHTTP", branch: "main"),
        .package(url: "https://github.com/kaseyb002/ToastKit-ios", branch: "main"),
        .package(url: "https://github.com/kean/Nuke", branch: "main"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "CoreUI",
            dependencies: [
                .product(name: "Colors", package: "Colors"),
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "HUDKit", package: "HUDKit-ios"),
                .product(name: "KaseyHTTP", package: "KaseyHTTP"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                .product(name: "ToastKit", package: "ToastKit-ios"),
            ],
        ),
        .testTarget(
            name: "CoreUITests",
            dependencies: ["CoreUI"]
        ),
    ]
)
