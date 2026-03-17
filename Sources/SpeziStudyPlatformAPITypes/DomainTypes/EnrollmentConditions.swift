//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// Note: This type is mapped from Components.Schemas.EnrollmentConditions via typeOverrides in openapi-generator-config.yaml
public enum EnrollmentConditions: String, Codable, Sendable {
    /// No special conditions, anyone can enroll.
    case none
    /// Enrollment requires a valid invitation code.
    case requiresInvitationCode
}
