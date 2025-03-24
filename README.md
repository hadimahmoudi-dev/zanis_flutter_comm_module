# Zanis Flutter Communication Module

## Project Overview
This project demonstrates creating and integrating a native iOS module with a Flutter application using platform channels.

It includes:
- A native Swift-based data simulation module (`DataCommunicationManager`).
- Flutter integration with platform channels to start and stop simulated data streams.
- Proper error handling and unit tests for the native module.
- Clear architectural design and self-review.

## Repository
[GitHub Repository](https://github.com/hadimahmoudi-dev/zanis_flutter_comm_module)

## Folder Structure
```
├── ios/
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   ├── DataCommunicationManager.swift
│   └── RunnerTests/
│       └── RunnerTests.swift
├── lib/
│   └── main.dart
├── recordings/
│   ├── part1_explanation.mp3
│   ├── part3_debugging.mp3
│   └── screen_recording_url.txt
├── README.md
```

## Recordings
All required recordings are available:
- **Part 1 Explanation:** part1_explanation.mp3
- **Part 3 Debugging & Self Review:** part3_debugging.mp3
- **Screen Recording (Part 2):** [View Recording](https://drive.google.com/file/d/1KkClmB_8D3e5tlcwBcrB6IU7VQiLogNY/view?usp=sharing)

## Setup Instructions
1. Clone the repository:
```
git clone https://github.com/hadimahmoudi-dev/zanis_flutter_comm_module
```
2. Open the Flutter project in your preferred IDE.
3. Run `flutter pub get` to fetch dependencies.
4. Open `ios/Runner.xcworkspace` in Xcode.
5. Build and run on an iOS simulator or device.

## Key Components
- **DataCommunicationManager:**
    - Simulates streaming data with random success or failure every 2 seconds.
    - Handles start and stop stream operations.

- **AppDelegate:**
    - Integrates the native Swift module with Flutter via platform channels.
    - Starts and stops the data stream based on Flutter requests.

- **Unit Tests:**
    - Provided in `RunnerTests.swift`.
    - Tests simulate error handling and successful data callbacks.

## Tools & Frameworks Used
- Flutter
- Xcode & XCTest
- Google Drive (for screen recording hosting)

## Architectural Decision
We used a Singleton design pattern for `DataCommunicationManager` to ensure a single source of data streaming logic and easy global access.

## Improvement Identified
A better structured error handling system can be implemented with custom error enums instead of `NSError` to make debugging more descriptive.

## Author
**Hadi Mahmoudi**
[LinkedIn](https://www.linkedin.com/in/hadi-mahmoudi)

