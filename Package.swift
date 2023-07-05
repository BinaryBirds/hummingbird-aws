// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "hummingbird-aws",
    platforms: [
       .macOS(.v12),
    ],
    products: [
        .library(name: "HummingbirdAWS", targets: ["HummingbirdAWS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird", from: "1.6.0"),
        .package(url: "https://github.com/binarybirds/hummingbird-services", from: "1.0.0"),
        .package(url: "https://github.com/soto-project/soto-core", from: "6.5.0"),
    ],
    targets: [
        .target(name: "HummingbirdAWS", dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
            .product(name: "HummingbirdServices", package: "hummingbird-services"),
            .product(name: "SotoCore", package: "soto-core"),
        ]),
        .testTarget(name: "HummingbirdAWSTests", dependencies: [
            .target(name: "HummingbirdAWS"),
        ])
    ]
)
