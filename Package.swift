// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SageKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SageKit",
            targets: ["SageKit"]
        ),
    ],
    targets: [
        .target(
            name: "SageKit"
        ),
    ]
)
