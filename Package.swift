// swift-tools-version:6.0

//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import class Foundation.ProcessInfo
import PackageDescription


var dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.7.0"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.0.0"),
    .package(url: "https://github.com/StanfordSpezi/SpeziFoundation.git", from: "2.7.3"),
    .package(url: "https://github.com/StanfordSpezi/SpeziHealthKit.git", from: "1.4.0"),
    .package(url: "https://github.com/StanfordSpezi/SpeziStudy.git", branch: "localized-metadata")
] + swiftLintPackage()

#if os(macOS) || os(Linux)
dependencies.append(.package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"))
#endif

var targets: [Target] = [
    .target(
        name: "SpeziStudyPlatformAPITypes",
        dependencies: [
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "SpeziLocalization", package: "SpeziFoundation"),
            .product(name: "SpeziHealthKit", package: "SpeziHealthKit"),
            .product(name: "SpeziStudyDefinition", package: "SpeziStudy")
        ],
        plugins: [] + swiftLintPlugin()
    ),
    .target(
        name: "SpeziStudyPlatformAPIClient",
        dependencies: [
            .target(name: "SpeziStudyPlatformAPITypes"),
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
        ],
        plugins: [] + swiftLintPlugin()
    ),
    .target(
        name: "SpeziStudyPlatformAPIServer",
        dependencies: [
            .target(name: "SpeziStudyPlatformAPITypes"),
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime")
        ],
        plugins: [] + swiftLintPlugin()
    ),
    .testTarget(
        name: "SpeziStudyPlatformAPITests",
        dependencies: [
            .target(name: "SpeziStudyPlatformAPITypes"),
            .target(name: "SpeziStudyPlatformAPIClient"),
            .target(name: "SpeziStudyPlatformAPIServer")
        ],
        plugins: [] + swiftLintPlugin()
    )
]

#if os(macOS) || os(Linux)
targets.append(
    .executableTarget(
        name: "SpeziStudyPlatformAPIGenerator",
        dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser")
        ],
        plugins: [] + swiftLintPlugin()
    )
)
#endif

let package = Package(
    name: "SpeziStudyPlatformAPI",
    platforms: [
        .iOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
        .tvOS(.v18),
        .macOS(.v15),
        .macCatalyst(.v18)
    ],
    products: [
        .library(name: "SpeziStudyPlatformAPITypes", targets: ["SpeziStudyPlatformAPITypes"]),
        .library(name: "SpeziStudyPlatformAPIClient", targets: ["SpeziStudyPlatformAPIClient"]),
        .library(name: "SpeziStudyPlatformAPIServer", targets: ["SpeziStudyPlatformAPIServer"])
    ],
    dependencies: dependencies,
    targets: targets
)


func swiftLintPlugin() -> [Target.PluginUsage] {
    // Fully quit Xcode and open again with `open --env SPEZI_DEVELOPMENT_SWIFTLINT /Applications/Xcode.app`
    if ProcessInfo.processInfo.environment["SPEZI_DEVELOPMENT_SWIFTLINT"] != nil {
        [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")]
    } else {
        []
    }
}

func swiftLintPackage() -> [PackageDescription.Package.Dependency] {
    if ProcessInfo.processInfo.environment["SPEZI_DEVELOPMENT_SWIFTLINT"] != nil {
        [.package(url: "https://github.com/realm/SwiftLint.git", from: "0.55.1")]
    } else {
        []
    }
}
