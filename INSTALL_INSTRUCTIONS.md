# Flutter Installation and Setup Instructions

This document provides step-by-step instructions to install Flutter SDK and required VS Code extensions for this project.

## Install Flutter SDK on Windows

1. **Download the Flutter SDK**:
   - Visit [Flutter SDK download page](https://docs.flutter.dev/get-started/install/windows)
   - Download the latest stable version of Flutter SDK zip file

2. **Extract the Flutter SDK**:
   - Create a folder at `C:\dev` (recommended) or another location of your choice
   - Extract the downloaded zip file to this folder (you should end up with `C:\dev\flutter`)
   - Avoid locations that require special permissions or have spaces in the path

3. **Update your PATH environment variable**:
   - Press `Windows + Pause` to open System Properties
   - Click on "Advanced system settings"
   - Click on "Environment Variables"
   - Under "User variables", find and edit the "Path" variable
   - Add `C:\dev\flutter\bin` to the list
   - Move it to the top of the list
   - Click "OK" to save changes

4. **Install Git for Windows**:
   - Download and install [Git for Windows](https://git-scm.com/download/win)
   - Follow the installation instructions

5. **Install Visual Studio 2022 with C++ workload**:
   - Download [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/)
   - During installation, select "Desktop development with C++" workload

6. **Verify the Installation**:
   - Open a new PowerShell window
   - Run `flutter --version` to verify Flutter is correctly installed
   - Run `flutter doctor` to check if there are any dependencies you still need to install

## Install VS Code Extensions

1. **Install Visual Studio Code**:
   - Download and install [Visual Studio Code](https://code.visualstudio.com/download)

2. **Install Required Extensions**:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Install the following extensions:
     1. **Dart** (by Dart Code)
     2. **Flutter** (by Dart Code)
     3. **Pubspec Assist** (quickly add dependencies)
     4. **Flutter Intl** (i18n codegen)
     5. **GitLens** (supercharge Git)
     6. **Bracket Pair Colorizer 2** (visual nesting)
     7. **Version Lens** (see pubspec updates)

3. **Configure VS Code for Flutter**:
   - Open VS Code
   - Open Command Palette (Ctrl+Shift+P)
   - Type "Flutter: New Project"
   - If prompted to locate the Flutter SDK, point it to `C:\dev\flutter`

## Setup for Android Development

1. **Install Android Studio**:
   - Download and install [Android Studio](https://developer.android.com/studio)
   - During installation, make sure to install the Android SDK
   - Accept all license agreements

2. **Configure Android SDK**:
   - Open Android Studio
   - Go to Tools > SDK Manager
   - Select the "SDK Platforms" tab
   - Check the box next to "Android API 33" (or the latest version)
   - Select the "SDK Tools" tab
   - Check "Android SDK Command-line Tools"
   - Click "Apply" to install

3. **Create an Android Emulator**:
   - In Android Studio, go to Tools > AVD Manager
   - Click "Create Virtual Device"
   - Select a device (e.g., Pixel 4)
   - Select a system image (e.g., Android 13.0)
   - Finish the setup

## Setup for iOS Development (for Mac users only)

1. **Install Xcode**:
   - Download and install Xcode from the Mac App Store
   - Install the Xcode Command Line Tools by running `xcode-select --install` in Terminal

2. **Agree to Xcode license**:
   - Run `sudo xcodebuild -license` in Terminal
   - Read and agree to the license

3. **Set up iOS Simulator**:
   - Open Xcode
   - Go to Xcode > Open Developer Tool > Simulator

## Troubleshooting

If you encounter any issues during the installation process, refer to the [Flutter troubleshooting guide](https://docs.flutter.dev/get-started/install/windows#troubleshoot-flutter-doctor-issues) or run `flutter doctor -v` for more detailed information. 