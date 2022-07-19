// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BetterSlug",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BetterSlug",
            targets: ["BetterSlug"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/KeanuPang/RegexSwift", branch: "main")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BetterSlug",
            dependencies: [
                .product(name: "RegexSwift", package: "RegexSwift")
            ]),
        .testTarget(
            name: "BetterSlugTests",
            dependencies: ["BetterSlug"]),
    ]
)
