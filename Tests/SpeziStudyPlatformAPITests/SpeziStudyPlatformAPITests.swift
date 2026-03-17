//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SpeziStudyPlatformAPIClient
import SpeziStudyPlatformAPIServer
import SpeziStudyPlatformAPITypes
import Testing


/// Compile-time guards that the generated files exist and expose the expected types.
/// If any generated file is deleted or empty, this file will fail to compile.
@Test func generatedTypesExist() {
    _ = (any APIProtocol).self  // Types.swift
    _ = Client.self             // Client.swift
    _ = Client.registerHandlers // Server.swift
}
