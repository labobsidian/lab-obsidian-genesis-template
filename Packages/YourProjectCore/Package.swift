// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "YourProjectCore",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "YourProjectCore",
            targets: ["YourProjectCore"]
        ),
    ],
    dependencies: [
        // Add your dependencies here
        // Example: .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourProjectCore",
            dependencies: [
                // Add target dependencies here
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ConciseMagicFile"),
                .enableUpcomingFeature("ForwardTrailingClosures"),
                .enableUpcomingFeature("ImportObjcForwardDeclarations"),
                .enableUpcomingFeature("DisableOutwardActorInference"),
                .enableUpcomingFeature("ExistentialAny"),
                .enableUpcomingFeature("DeprecateApplicationMain"),
                .enableUpcomingFeature("GlobalConcurrency"),
                .enableUpcomingFeature("IsolatedDefaultValues")
            ]
        ),
        .testTarget(
            name: "YourProjectCoreTests",
            dependencies: ["YourProjectCore"]
        ),
    ]
)