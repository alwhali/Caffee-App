# Caffee App

A Flutter mobile application for browsing a coffee and drink menu with an interactive, animated user interface.

---

## Overview

Caffee App is a drink menu browser built with Flutter. It displays a scrollable list of drinks with images, names, prices, and descriptions. Users can tap any drink to view detailed information, select cup size (Small/Medium/Large), choose between Hot or Cold, and set a quantity counter. The app features smooth scroll animations and a PageView-based detail carousel.

**Target audience:** Coffee shop customers browsing a digital menu.

**Key capabilities:**
- Browse a curated list of drinks
- View detailed information for each drink
- Select drink size and temperature preference
- Adjust quantity with a counter

---

## Features

### Menu Browsing
- Scrollable vertical list of drinks with animated scaling effects
- Each card displays drink name, description, and a forward arrow
- Drink images with shadow effects

### Drink Details
- PageView carousel for swiping between drinks
- Full-size drink image display
- Drink name, description, and price
- Shadow effect beneath each drink image

### Customization
- Size selection: Small, Medium, Large (visualized with coffee cup icons)
- Temperature toggle: Hot / Cold with animated switch
- Quantity counter with increment and decrement controls

### Navigation
- Tap a drink card to navigate to the details screen
- Arrow icon on each card for visual affordance

---

## Tech Stack

| Category              | Technology                          |
|-----------------------|-------------------------------------|
| Framework             | Flutter >=3.35.0                    |
| Language              | Dart >=3.10.4                       |
| Architecture          | Single-layer (no formal architecture) |
| State Management      | `setState`                          |
| Routing               | `Navigator.push` (MaterialPageRoute) |
| Dependency Injection  | None                                |
| Networking            | None                                |
| Database              | None                                |
| Local Storage         | None                                |
| Secure Storage        | None                                |
| Authentication        | None                                |
| Notifications         | None                                |
| Firebase              | None                                |
| Analytics             | None                                |
| Code Generation       | None                                |
| SVG Rendering         | `flutter_svg` ^2.3.0                |
| Icons                 | `cupertino_icons` ^1.0.8            |
| Testing               | `flutter_test` (default template)   |
| Linting               | `flutter_lints` ^6.0.0              |
| CI/CD                 | None                                |

---

## Project Architecture

The project uses a **simple single-layer architecture** with no formal separation of concerns. All logic, UI, and data are organized into folders by type rather than by feature.

- **Data:** Drink data is hardcoded as a list of `DrinkModel` objects in `lib/model/drink_model.dart`.
- **State:** A single global variable (`indexOfDrink`) in `lib/global_variable.dart` tracks the currently selected drink index.
- **UI:** Screens and widgets are built using `StatefulWidget` with local `setState` for state management.
- **Navigation:** Direct `Navigator.push` calls with `MaterialPageRoute`.

---

## Project Structure

```
caffee_app/
├── android/                  # Android platform configuration
│   ├── app/
│   │   └── src/main/
│   │       ├── kotlin/       # MainActivity.kt
│   │       └── res/          # Android resources (icons, themes)
│   ├── build.gradle.kts      # Root Gradle config
│   ├── settings.gradle.kts   # Gradle settings
│   └── gradle/               # Gradle wrapper
├── assets/
│   ├── cart.png              # Cart icon
│   ├── Vector.svg            # SVG asset
│   ├── drinks/               # Drink images (12 PNGs + shadow.png)
│   └── logo/                 # App logo
├── lib/
│   ├── main.dart             # App entry point
│   ├── global_variable.dart  # Global state (indexOfDrink)
│   ├── model/
│   │   └── drink_model.dart  # DrinkModel class + hardcoded drink data
│   ├── screens/
│   │   ├── home.dart         # Home screen (drink menu list)
│   │   └── details.dart      # Details screen (drink detail view)
│   └── widgets/
│       └── drink_card_widget.dart  # Reusable drink card widget
├── test/
│   └── widget_test.dart      # Default Flutter widget test
├── web/                      # Web platform configuration
│   ├── index.html
│   ├── manifest.json
│   └── icons/                # PWA icons
├── windows/                  # Windows platform configuration
│   ├── flutter/              # Generated plugin registrant
│   └── runner/               # Windows runner (C++)
├── analysis_options.yaml     # Dart lint rules
├── pubspec.yaml              # Project dependencies & metadata
└── pubspec.lock              # Locked dependency versions
```

### Directory Responsibilities

| Directory/File       | Responsibility                                      |
|----------------------|-----------------------------------------------------|
| `lib/main.dart`      | App entry point. Creates `MaterialApp` with `Home` as the initial screen. |
| `lib/global_variable.dart` | Holds a single global `int? indexOfDrink` variable used to pass the selected drink index between screens. |
| `lib/model/`         | Contains `DrinkModel` (data class with `name`, `image`, `price`, `description`) and the hardcoded `drinks` list. |
| `lib/screens/`       | Full-screen UI pages: `Home` (menu list) and `Details` (drink detail with carousel). |
| `lib/widgets/`       | Reusable UI components: `MyCardDrink` (drink card with image, name, description). |
| `assets/`            | Static assets: drink images, logo, cart icon, SVG, shadow image. |
| `test/`              | Widget tests (default Flutter template, not customized for this app). |
| `android/`           | Android platform files (Kotlin, Gradle, manifest, resources). |
| `web/`               | Web platform files (HTML, manifest, PWA icons). |
| `windows/`           | Windows desktop platform files (C++ runner, CMake). |

---

## Prerequisites

- **Flutter SDK** >=3.35.0
- **Dart SDK** >=3.10.4 (bundled with Flutter)
- **Android Studio** (for Android development)
- **Visual Studio Code** or **IntelliJ IDEA** (recommended IDE)
- **Java 17** (for Android Gradle plugin)
- **Git** (for version control)

For Windows desktop builds:
- **Visual Studio** with C++ development tools

For web builds:
- A modern web browser

---

## Installation

### Clone the Repository

```bash
git clone https://github.com/alwhali/Caffee-App.git
cd caffee_app
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

To run on a specific platform:

```bash
flutter run -d android    # Android
flutter run -d chrome     # Web
flutter run -d windows    # Windows
```

---

## Build

### Android

```bash
flutter build apk          # Debug APK
flutter build appbundle    # Release App Bundle
```

### Web

```bash
flutter build web
```

### Windows

```bash
flutter build windows
```

---

## Configuration

Not found in the repository. The project has no environment variables, `.env` files, Firebase configuration, build flavors, or API configuration.

---

## Usage

### Start the Project

```bash
flutter run
```

### Add a New Drink

Edit `lib/model/drink_model.dart` and add a new `DrinkModel` entry to the `drinks` list:

```dart
DrinkModel(
  name: 'New Drink',
  image: 'assets/drinks/new_drink.png',
  price: '\$5.00',
  description: 'Description of the new drink.',
),
```

Then add the corresponding image to `assets/drinks/`.

### Add a New Screen

1. Create a new Dart file in `lib/screens/`.
2. Create a `StatefulWidget` or `StatelessWidget`.
3. Navigate to it using `Navigator.push`:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => YourNewScreen()),
);
```

### Add Assets

1. Place the asset file in the appropriate `assets/` subdirectory.
2. Register the asset path in `pubspec.yaml` under the `flutter > assets` section.

### Add Dependencies

```bash
flutter pub add <package-name>
```

---

## Data Storage

Not found in the repository. The project uses **no local database, secure storage, or persistent storage solution**. All drink data is hardcoded in `lib/model/drink_model.dart` as a `List<DrinkModel>`. No user data is persisted.

---

## Assets

### Images

| Path                    | Description          |
|-------------------------|----------------------|
| `assets/cart.png`       | Cart/shopping icon   |
| `assets/Vector.svg`     | SVG vector graphic   |
| `assets/logo/logo.png`  | App logo             |
| `assets/drinks/Banana.png` | Banana drink image  |
| `assets/drinks/Brownie_Island.png` | Brownie Island drink image |
| `assets/drinks/burger.png` | Burger image      |
| `assets/drinks/carmel.png` | Caramel drink image |
| `assets/drinks/chicken.png` | Chicken image    |
| `assets/drinks/Chocolate.png` | Chocolate drink image |
| `assets/drinks/Ellipse 2.png` | Decorative ellipse |
| `assets/drinks/Peanut_Butter.png` | Peanut Butter drink image |
| `assets/drinks/Salted_Caramel.png` | Salted Caramel drink image |
| `assets/drinks/shadow.png` | Shadow effect under drink images |
| `assets/drinks/Strawberry.png` | Strawberry drink image |

### Icons

- `cupertino_icons` package provides iOS-style icons.
- Material Design icons are used via `Icons.*` (e.g., `Icons.local_cafe`, `Icons.add`, `Icons.remove`).

### Fonts

Not found in the repository. The app uses the default Flutter system fonts.

---

## Testing

### Widget Tests

The project includes a default Flutter widget test at `test/widget_test.dart`. This test was generated by the Flutter template and has **not been updated** to match the current app's UI. It tests a counter increment scenario that does not exist in the current codebase.

### Run Tests

```bash
flutter test
```

### Test Coverage

Not found in the repository. No unit tests, widget tests (beyond the default template), or integration tests have been implemented for the app's actual features.

---

## Code Quality

### Lint Rules

The project uses `flutter_lints` ^6.0.0 with the default `package:flutter_lints/flutter.yaml` rule set. No custom lint rules have been configured.

### Static Analysis

Run the Dart analyzer to check for issues:

```bash
flutter analyze
```

### Formatting

Format Dart code using:

```bash
dart format .
```

### Recommended Workflow

1. Run `flutter analyze` to check for issues.
2. Run `dart format .` to ensure consistent code formatting.
3. Run `flutter test` to verify tests pass.

---

## Performance Notes

The following performance-related implementations were found in the repository:

- **Scroll animation:** The home screen uses `AnimatedBuilder` with a `ScrollController` to apply scaling and translation effects to list items as the user scrolls, creating a parallax-like visual effect.
- **PageView carousel:** The details screen uses `PageView.builder` with `viewportFraction: 0.6` for efficient lazy-loading of drink detail pages.
- **Image assets:** Drink images are loaded from local assets (no network requests).

Not found in the repository: caching, lazy loading (beyond PageView), pagination, image optimization, or code splitting.

---

## Screenshots

Screenshots are not included in the repository. Below are placeholder descriptions of the app's screens:

| Screen     | Description                                      |
|------------|--------------------------------------------------|
| **Home**   | Scrollable list of drink cards with images, names, and descriptions. AppBar with "Menu" title and cart icon.
<img src="lib/screens/home.dart" width="300">
| **Details**| Full-screen drink detail with PageView carousel, drink image with shadow, name, description, price, size selector (Small/Medium/Large), Hot/Cold toggle, and quantity counter. 
<img src="lib/screens/details.dart" width="300">
|

---

## Roadmap

Not found in the repository.

---

## Known Limitations

- **No persistent storage:** Drink data is hardcoded; no backend API or local database is used.
- **No state management library:** Uses only `setState`, which may not scale well for larger applications.
- **No authentication:** The app has no user login or account system.
- **No ordering functionality:** The cart icon is displayed but not connected to any cart or checkout logic.
- **No localization:** The UI is in English only.
- **No error handling:** No network error handling or data validation (no network calls exist).
- **Default test not updated:** The widget test at `test/widget_test.dart` is the default Flutter template test and does not test the actual app UI.
- **Global variable for state:** `indexOfDrink` is a mutable global variable, which is not a scalable or testable pattern.

---

## Contributing

Contributions are welcome! To contribute to this project:

1. **Fork** the repository on GitHub.
2. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit your changes** with clear, descriptive commit messages.
4. **Push to your fork:**
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Open a Pull Request** against the `main` branch.

### Guidelines

- Follow the existing code style and structure.
- Run `flutter analyze` and `dart format .` before submitting.
- Update or add tests for any new functionality.
- Keep pull requests focused on a single feature or fix.

---

## License

This project currently has no LICENSE file.

---

## Acknowledgments

- [Flutter](https://flutter.dev/) — UI framework
- [Dart](https://dart.dev/) — Programming language
- [flutter_svg](https://pub.dev/packages/flutter_svg) — SVG rendering
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) — iOS-style icons
- [flutter_lints](https://pub.dev/packages/flutter_lints) — Lint rules
- [Material Design](https://material.io/) — Design system and icons

---

## Contact

- **GitHub Repository:** [https://github.com/alwhali/Caffee-App](https://github.com/alwhali/Caffee-App)