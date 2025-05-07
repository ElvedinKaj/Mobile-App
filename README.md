# Cross-Platform Mobile App

A Flutter application that works on both iOS and Android platforms.

## Getting Started

This project is a Flutter mobile application that targets both iOS and Android devices.

### Prerequisites

Before running this project, make sure you have the following installed:

1. [Flutter SDK](https://docs.flutter.dev/get-started/install)
2. [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
3. IDE with Flutter support (Visual Studio Code, Android Studio, etc.)
4. For iOS development: Xcode (Mac only)
5. For Android development: Android Studio with Android SDK

### Flutter SDK Installation

1. Download the Flutter SDK from the [official website](https://docs.flutter.dev/get-started/install)
2. Extract the downloaded zip file to a location of your choice
3. Add the Flutter `bin` directory to your system PATH
4. Run `flutter doctor` to verify the installation and identify any other dependencies needed

### VS Code Extensions for Flutter Development

For optimal development experience in VS Code, install these extensions:

1. Dart (by Dart Code)
2. Flutter (by Dart Code)
3. Pubspec Assist (quickly add dependencies)
4. Flutter Intl (i18n codegen)
5. GitLens (supercharge Git)
6. Bracket Pair Colorizer 2 (visual nesting)
7. Version Lens (see pubspec updates)

### Running the Project

```bash
# Get all dependencies
flutter pub get

# Run the app in debug mode
flutter run

# Build an APK
flutter build apk

# Build an iOS app (Mac only)
flutter build ios
```

## Project Structure

```
lib/
├── main.dart              # Entry point of the application
├── screens/               # UI screens
├── widgets/               # Reusable UI components
├── models/                # Data models
├── services/              # API and other services
└── utils/                 # Utilities and helpers
```

## Features

- Cross-platform support (iOS and Android)
- Modern Material Design 3 UI
- Responsive layout for different screen sizes

## Dependencies

This project uses several packages:

- `http` - For making API requests
- `shared_preferences` - For local storage
- `provider` - For state management
- `intl` - For internationalization

## License

This project is licensed under the MIT License. 