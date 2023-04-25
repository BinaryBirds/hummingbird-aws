// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hummingbird-aws",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "AWS", targets: ["AWS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "1.0.0"),
        .package(url: "https://github.com/soto-project/soto.git", from: "6.2.0")
    ],
    targets: [
        .target(name: "AWS", dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
            .product(name: "SotoSES", package: "soto"),
        ]),
        .testTarget(name: "AWSTests", dependencies: [
            .target(name: "AWS"),
        ])
    ]
)
