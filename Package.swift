// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IoTConnectSPM",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IoTConnectSPM",
            targets: ["IoTConnectSPM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/emqx/CocoaMQTT.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IoTConnectSPM",
            dependencies: [
                .target(name: "IoTConnect_2_0"),
                .product(name: "CocoaMQTT", package: "CocoaMQTT"),
            ]
        ),
        .testTarget(
            name: "IoTConnectSPMTests",
            dependencies: ["IoTConnectSPM"]),
        .binaryTarget(
            name: "IoTConnect_2_0",
            path: "./Sources/IoTConnect_2_0.xcframework")
    ]
)

