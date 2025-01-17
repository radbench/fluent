// swift-tools-version:5.2
import PackageDescription

//VS2
let package = Package(
    name: "fluent",
    platforms: [
       .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "Fluent", targets: ["Fluent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.0.0"),
//        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/radbench/vapor.git", .branch("master")),
    ],
    targets: [
        .target(name: "Fluent", dependencies: [
            .product(name: "FluentKit", package: "fluent-kit"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "FluentTests", dependencies: [
            .target(name: "Fluent"),
            .product(name: "XCTFluent", package: "fluent-kit"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
