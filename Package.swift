// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "BenKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "BenKit",
            targets: ["BenKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins.git", .upToNextMajor(from: "0.57.0"))
    ],
    targets: [
        .target(
            name: "BenKit",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
    ]
)
