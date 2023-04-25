// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "hummingbird-aws",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .library(name: "HummingbirdAWS", targets: ["HummingbirdAWS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hummingbird-project/hummingbird", from: "1.4.0"),
        .package(url: "https://github.com/soto-project/soto-core", from: "6.5.0"),
    ],
    targets: [
        .target(name: "HummingbirdAWS", dependencies: [
            .product(name: "Hummingbird", package: "hummingbird"),
            .product(name: "SotoCore", package: "soto-core"),
        ]),
        .testTarget(name: "HummingbirdAWSTests", dependencies: [
            .target(name: "HummingbirdAWS"),
        ])
    ]
)
