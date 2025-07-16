// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "YourProjectUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "YourProjectUI",
            targets: ["YourProjectUI"]
        ),
    ],
    dependencies: [
        .package(path: "../YourProjectCore"),
        // Add additional UI dependencies here
    ],
    targets: [
        .target(
            name: "YourProjectUI",
            dependencies: [
                "YourProjectCore"
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
            name: "YourProjectUITests",
            dependencies: ["YourProjectUI"]
        ),
    ]
)