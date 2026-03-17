//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// Note: This type is mapped from Components.Schemas.QuestionnaireContent via typeOverrides in openapi-generator-config.yaml
public struct QuestionnaireContent: Hashable, Codable, Sendable {
    public let questionnaire: String

    public init(questionnaire: String) {
        self.questionnaire = questionnaire
    }
}
