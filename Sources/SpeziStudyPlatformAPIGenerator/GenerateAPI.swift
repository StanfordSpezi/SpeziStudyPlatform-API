//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import ArgumentParser
import Foundation


@main
struct GenerateAPI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "generate-api",
        abstract: "Generate OpenAPI types, client, and server Swift code."
    )

    @Option(name: .long, help: "Path to the OpenAPI spec file.")
    var spec: String = "openapi.yaml"

    @Flag(name: .long, help: "Generate the types target.")
    var types = false

    @Flag(name: .long, help: "Generate the client target.")
    var client = false

    @Flag(name: .long, help: "Generate the server target.")
    var server = false

    private var generateAll: Bool {
        !types && !client && !server
    }

    private struct Target {
        let label: String
        let config: String
        let outputDirectory: String
    }

    private static let allTargets: [Target] = [
        Target(
            label: "Types",
            config: "openapi-generator-config-types.yaml",
            outputDirectory: "Sources/SpeziStudyPlatformAPITypes/Generated"
        ),
        Target(
            label: "Client",
            config: "openapi-generator-config-client.yaml",
            outputDirectory: "Sources/SpeziStudyPlatformAPIClient/Generated"
        ),
        Target(
            label: "Server",
            config: "openapi-generator-config-server.yaml",
            outputDirectory: "Sources/SpeziStudyPlatformAPIServer/Generated"
        )
    ]

    mutating func run() throws {
        let selectedTargets: [Target]
        if generateAll {
            selectedTargets = Self.allTargets
        } else {
            selectedTargets = Self.allTargets.filter { target in
                switch target.label {
                case "Types": types
                case "Client": client
                case "Server": server
                default: false
                }
            }
        }

        for target in selectedTargets {
            try generate(target)
        }
    }

    private func generate(_ target: Target) throws {
        print("Generating \(target.label)...")

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = [
            "swift-openapi-generator", "generate", spec,
            "--config", target.config,
            "--output-directory", target.outputDirectory
        ]

        try process.run()
        process.waitUntilExit()

        guard process.terminationStatus == 0 else {
            throw ExitCode(process.terminationStatus)
        }
    }
}
