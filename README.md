<!--

This source file is part of the Stanford Spezi open source project

SPDX-FileCopyrightText: 2026 Stanford University and the project authors (see CONTRIBUTORS.md)

SPDX-License-Identifier: MIT

-->

# SpeziStudyPlatform-API

[![Build and Test](https://github.com/StanfordSpezi/SpeziStudyPlatform-API/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/StanfordSpezi/SpeziStudyPlatform-API/actions/workflows/build-and-test.yml)

Shared OpenAPI spec, generated types, client, and server stubs for the Spezi Study Platform.


## Code Generation

The generated `Types.swift`, `Client.swift`, and `Server.swift` are committed to the repo. To regenerate them after updating `openapi.yaml`, run:

```bash
swift run SpeziStudyPlatformAPIGenerator
```

You can also generate specific targets only:

```bash
swift run SpeziStudyPlatformAPIGenerator --types --client
```


## Installation

The project can be added to your Xcode project or Swift Package using the [Swift Package Manager](https://github.com/apple/swift-package-manager).

**Xcode:** For an Xcode project, follow the instructions on [adding package dependencies to your app](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

**Swift Package:** You can follow the [Swift Package Manager documentation about defining dependencies](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs/addingdependencies/) to add this project as a dependency to your Swift Package.


## License

This project is licensed under the MIT License. See [Licenses](https://github.com/StanfordSpezi/SpeziStudyPlatform-API/tree/main/LICENSES) for more information.


## Contributors

This project is developed as part of the Stanford Spezi ecosystem at Stanford University.
See [CONTRIBUTORS.md](https://github.com/StanfordSpezi/SpeziStudyPlatform-API/tree/main/CONTRIBUTORS.md) for a full list of all SpeziStudyPlatformAPI contributors.

![Stanford Mussallem Center for Biodesign Logo](https://raw.githubusercontent.com/StanfordBDHG/.github/main/assets/biodesign-footer-light.png#gh-light-mode-only)
![Stanford Mussallem Center for Biodesign Logo](https://raw.githubusercontent.com/StanfordBDHG/.github/main/assets/biodesign-footer-dark.png#gh-dark-mode-only)
