# 📱 Flutter Calculator

A clean, responsive calculator app built from scratch while learning Flutter. This project focuses on UI layout, state management, and handling user input.

## ✨ Features
- **Full Arithmetic:** Supports addition, subtraction, multiplication, and division.
- **Percentage & Clear:** Includes a percentage converter and a "Clear All" function.
- **Responsive UI:** Uses `MediaQuery` to ensure the layout fits perfectly on any screen size.
- **Dark Mode:** A sleek dark theme for better visibility.
- **Scrollable Display:** A `SingleChildScrollView` that automatically scrolls to the most recent input.

## 🧱 Key Components Used
- `StatefulWidget`: Used to manage the calculator logic and display updates.
- `Wrap` & `SizedBox`: To build the grid of buttons efficiently.
- `InkWell` & `Material`: To create interactive buttons with "ripple" effects.
- `Custom Class`: Used a separate `ButtonValues` class to keep the code organized.

## 🧠 What I Learned
- How to manage "State" in Flutter using `setState`.
- The importance of `const` for performance optimization.
- How to structure a Widget Tree with nested `Rows` and `Columns`.
- How to debug logic errors in Dart functions.

## 🚀 How to Run
1. Clone this repository.
2. Ensure you have the Flutter SDK installed.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` on your connected device or emulator.
