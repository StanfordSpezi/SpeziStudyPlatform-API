//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// Note: This type is mapped from Components.Schemas.StudyVisibility via typeOverrides in openapi-generator-config.yaml
public enum StudyVisibility: String, Codable, Sendable {
    /// Listed in public study browsing.
    case `public`
    /// Only accessible via an invitation code.
    case unlisted
}
