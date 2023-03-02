// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HybridKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "HybridKit",
            targets: ["HybridKit"]
        )
    ],
    targets: [
        .target(
            name: "HybridKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "HybridKitTests",
            dependencies: ["HybridKit"],
            path: "Tests"
        )
    ]
)
