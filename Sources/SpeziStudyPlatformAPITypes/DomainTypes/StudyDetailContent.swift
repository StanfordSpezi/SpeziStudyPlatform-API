//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//


/// Note: This type is mapped from Components.Schemas.StudyDetailContent via typeOverrides in openapi-generator-config.yaml
public struct StudyDetailContent: Codable, Sendable, Hashable {
    public var title: String
    public var shortTitle: String
    public var explanationText: String
    public var shortExplanationText: String

    public init(title: String = "", shortTitle: String = "", explanationText: String = "", shortExplanationText: String = "") {
        self.title = title
        self.shortTitle = shortTitle
        self.explanationText = explanationText
        self.shortExplanationText = shortExplanationText
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.shortTitle = try container.decodeIfPresent(String.self, forKey: .shortTitle) ?? ""
        self.explanationText = try container.decodeIfPresent(String.self, forKey: .explanationText) ?? ""
        self.shortExplanationText = try container.decodeIfPresent(String.self, forKey: .shortExplanationText) ?? ""
    }
}
