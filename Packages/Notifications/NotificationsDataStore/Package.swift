// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "NotificationsDataStore",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "NotificationsDataStore",
            targets: ["NotificationsDataStore"]
        ),
    ],
    dependencies: [
        .package(name: "Extensions", path: "../../Utility/Extensions"),
        .package(name: "GroupModel", path: "../../Group/GroupModel"),
        .package(name: "Logger", path: "../../Utility/Logger"),
        .package(name: "NotificationsClient", path: "../NotificationsClient"),
        .package(name: "NotificationsModel", path: "../NotificationsModel"),
//        .package(url: "https://github.com/firebase/firebase-ios-sdk", branch: "main"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "11.3.0"),
    ],
    targets: [
        .target(
            name: "NotificationsDataStore",
            dependencies: [
                .product(name: "Extensions", package: "Extensions"),
                .product(name: "FirebaseCore", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "GroupModel", package: "GroupModel"),
                .product(name: "Logger", package: "Logger"),
                .product(name: "NotificationsClient", package: "NotificationsClient"),
                .product(name: "NotificationsModel", package: "NotificationsModel"),
            ]
        ),
        .testTarget(
            name: "NotificationsDataStoreTests",
            dependencies: ["NotificationsDataStore"]
        ),
    ]
)

