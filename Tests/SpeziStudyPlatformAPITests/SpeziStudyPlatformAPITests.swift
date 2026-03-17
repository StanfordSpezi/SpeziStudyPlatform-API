//
// This source file is part of the Stanford Spezi open source project
//
// SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import Foundation
import SpeziStudyPlatformAPITypes
import Testing


struct SpeziStudyPlatformAPITests {
    @Test
    func studyDetailContentDefaults() {
        let detail = StudyDetailContent()
        #expect(detail.title == "")
        #expect(detail.shortTitle == "")
        #expect(detail.explanationText == "")
        #expect(detail.shortExplanationText == "")
    }

    @Test
    func studyDetailContentRoundTrip() throws {
        let original = StudyDetailContent(title: "Test Study", shortTitle: "TS")
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(StudyDetailContent.self, from: data)
        #expect(original == decoded)
    }

    @Test
    func consentContentDefaults() {
        let consent = ConsentContent()
        #expect(consent.title == "")
        #expect(consent.content == "")
    }

    @Test
    func studyVisibilityRawValues() {
        #expect(StudyVisibility.public.rawValue == "public")
        #expect(StudyVisibility.unlisted.rawValue == "unlisted")
    }

    @Test
    func enrollmentConditionsRawValues() {
        #expect(EnrollmentConditions.none.rawValue == "none")
        #expect(EnrollmentConditions.requiresInvitationCode.rawValue == "requiresInvitationCode")
    }

    @Test
    func informationalContentInit() {
        let content = InformationalContent(title: "Welcome", content: "Hello")
        #expect(content.title == "Welcome")
        #expect(content.lede == nil)
        #expect(content.content == "Hello")
    }

    @Test
    func questionnaireContentInit() {
        let content = QuestionnaireContent(questionnaire: "{}")
        #expect(content.questionnaire == "{}")
    }
}
