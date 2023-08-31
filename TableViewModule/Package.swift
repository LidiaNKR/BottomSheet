// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TableViewModule",
    products: [
        .library(
            name: "TableViewModule",
            targets: ["AssemblyBuilder", "NetworkService", "TableViewModule"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AssemblyBuilder",
            dependencies: []),
        .target(
            name: "NetworkService",
            dependencies: []),
        .target(
            name: "TableViewModule",
            dependencies: ["NetworkService"]),
        .testTarget(
            name: "ModelsModuleTests",
            dependencies: ["TableViewModule"]),
    ]
)
