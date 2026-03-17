//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// Note: This type is mapped from Components.Schemas.InformationalContent via typeOverrides in openapi-generator-config.yaml
public struct InformationalContent: Hashable, Codable, Sendable {
    public let title: String
    public let lede: String?
    public let content: String

    public init(title: String, lede: String? = nil, content: String) {
        self.title = title
        self.lede = lede
        self.content = content
    }
}
