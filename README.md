# Portfolio Web & Mobile

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A single-page developer portfolio built with Flutter and Material 3. It runs natively across web, desktop, and mobile from a single codebase, with zero third-party UI dependencies to keep maintenance minimal and builds fast.

---

## Concepts Included In The UI Design

<img width="1280" height="652" alt="Screenshot 2026-10-28 000040" src="https://github.com/user-attachments/assets/2e28892d-8423-4957-a6e1-5b94b7818b98" />


| Element | Flutter Widget | Used For |
| :--- | :--- | :--- |
| **Text** | `Text` | Titles, bio, and descriptions |
| **Image** | `Image` | Profile picture (`profile.jpeg`) |
| **Icons** | `Icon` | Tech and social icons |
| **Buttons** | `ElevatedButton`, `IconButton` | "Contact Me", links, and theme toggle |

<img width="1280" height="655" alt="Screenshot 2026-10-28 005409" src="https://github.com/user-attachments/assets/588301f8-f87c-4fce-8bc8-5863eb319a1c" />

| Element | Flutter Widget | Used For |
| :--- | :--- | :--- |
| **Input Fields** | `TextFormField` | Name, email, and message boxes |
| **Cards & Boxes** | `Container` | Project cards and colored boxes |
| **Lists & Grids** | `GridView`, `ListView` | Project cards, skills, and timeline |
| **Progress Bars** | `LinearProgressIndicator` | Skill percentages (e.g., 90%) |

---


## Demo Preview


https://github.com/user-attachments/assets/896c5ae7-36c5-4dfd-9a48-b6fd569046db
- **Desktop:** `w >= 1150px` (Multi-column grids, inline navigation)
- **Mobile:** `w < 900px` (Single column, drawer menu, touch-friendly tap targets)


---

## Experiments 1-10

A comprehensive collection of 10 hands-on Flutter and Dart experiments demonstrating foundational to advanced cross-platform development concepts applied to this portfolio project.

### Experiment 1 - Dart Basics
Variables, built-in primitive types, arithmetic operations, string interpolation, and conditional evaluation applied to developer portfolio metrics (projects, experience, and availability status).
- **File:** [`experiments/01_dart_basics.dart`](experiments/01_dart_basics.dart)
- **Run:** `dart run experiments/01_dart_basics.dart`

### Experiment 2 - Flutter Widgets and Layouts
Explores core Flutter layout widgets using **Row**, **Column**, and **Stack** to construct a portfolio hero card with a layered avatar banner and horizontal developer metrics.
- **File:** [`experiments/02_widgets_layouts.dart`](experiments/02_widgets_layouts.dart)
- **Run:** `flutter run -t experiments/02_widgets_layouts.dart`

### Experiment 3 - Responsive UI
Uses **MediaQuery** and screen width breakpoints (`800px`) to adapt the portfolio layout between a two-column desktop arrangement and a scrollable single-column mobile view.
- **File:** [`experiments/03_responsive_ui.dart`](experiments/03_responsive_ui.dart)
- **Run:** `flutter run -t experiments/03_responsive_ui.dart`

### Experiment 4 - Navigation and Named Routes
Implements multi-screen navigation using **Navigator.pushNamed()**, centralized route constants, and clean screen separation (`/`, `/projects`, `/skills`, `/contact`).
- **File:** [`experiments/04_navigation_named_routes.dart`](experiments/04_navigation_named_routes.dart)
- **Run:** `flutter run -t experiments/04_navigation_named_routes.dart`

### Experiment 5 - Stateful & Stateless Widgets + State Management
- **5A (`05_setstate_counter.dart`):** Demonstrates **StatelessWidget**, **StatefulWidget**, and **setState()** with an interactive project endorsement counter.
- **5B (`05_state_management.dart`):** Demonstrates decoupled state management using **ChangeNotifier** and **ListenableBuilder** for project rating and dynamic theme switching without third-party dependencies.
- **Run:** `flutter run -t experiments/05_setstate_counter.dart` or `flutter run -t experiments/05_state_management.dart`

### Experiment 6 - Custom Widgets and Themes
Builds reusable custom widgets (`ReusableProfileHeader`, `ReusableProjectCard`) and styles them with Material 3 **ThemeData**, custom text styles, and elevated card themes.
- **File:** [`experiments/06_custom_widgets_themes.dart`](experiments/06_custom_widgets_themes.dart)
- **Run:** `flutter run -t experiments/06_custom_widgets_themes.dart`

### Experiment 7 - Forms, Validation and Error Handling
Designs an interactive developer contact / hire form featuring field-level validation, regex patterns for email verification, error messaging, and **SnackBar** submission feedback using **Form**, **GlobalKey<FormState>**, and **TextFormField**.
- **File:** [`experiments/07_forms_validation.dart`](experiments/07_forms_validation.dart)
- **Run:** `flutter run -t experiments/07_forms_validation.dart`

### Experiment 8 - Animations
Uses Flutter's animation framework with **AnimationController**, **CurvedAnimation**, **FadeTransition**, and **SlideTransition** to build a smooth entrance effect for portfolio cards with a replay button.
- **File:** [`experiments/08_animations.dart`](experiments/08_animations.dart)
- **Run:** `flutter run -t experiments/08_animations.dart`

### Experiment 9 - REST API Integration
Fetches live repository data from the public **GitHub REST API** (`api.github.com/users/rehan-abc/repos`), decodes JSON into typed Dart models, and renders data using **FutureBuilder** with loading spinners, error boundaries, and a pull-to-refresh action.
- **File:** [`experiments/09_rest_api.dart`](experiments/09_rest_api.dart)
- **Run:** `flutter run -t experiments/09_rest_api.dart`

### Experiment 10 - Testing and Debugging in Flutter
Demonstrates automated widget testing architectures (`testWidgets`, `find.text`, `tester.pumpAndSettle()`) and highlights Flutter debugging tools including Flutter Inspector, DevTools Profiler, breakpoints, and verification commands (`flutter analyze`, `flutter test`).
- **File:** [`experiments/10_testing_debugging.dart`](experiments/10_testing_debugging.dart)
- **Run:** `flutter run -t experiments/10_testing_debugging.dart`

## Experiment Files

```text
experiments/
├── 01_dart_basics.dart
├── 02_widgets_layouts.dart
├── 03_responsive_ui.dart
├── 04_navigation_named_routes.dart
├── 05_setstate_counter.dart
├── 05_state_management.dart
├── 06_custom_widgets_themes.dart
├── 07_forms_validation.dart
├── 08_animations.dart
├── 09_rest_api.dart
└── 10_testing_debugging.dart
```

---

## Layout & Design System

- **Breakpoints:**
  - **Desktop:** `w >= 1150px` (Multi-column grids, inline navigation)
  - **Tablet:** `900px <= w < 1150px` (2-column grids, adapted spacing)
  - **Mobile:** `w < 900px` (Single column, drawer menu, touch-friendly tap targets)
- **Themes:** Pre-configured Slate Dark (`#0F172A`) and Clean Light (`#F8FAFC`) palettes with indigo/cyan accents.
- **Scroll Behavior:** Uses `Scrollable.ensureVisible` with cubic ease curves to scroll smoothly to section GlobalKeys.

---

## Customization Guide

You can adapt this portfolio to your own profile in a few minutes by editing two files:

### 1. Personal details & links
Open `lib/constants/app_constants.dart` and update your info:
```dart
static const String developerName = "Your Name";
static const String developerTitle = "Your Title";
static const String developerEmail = "you@example.com";
static const String githubUrl = "https://github.com/your-handle";
```

### 2. Projects, skills & timeline
Open `lib/data/portfolio_data.dart` to edit the list of projects, technical skills, and experience items:
```dart
static const List<ProjectModel> projects = [
  ProjectModel(
    title: "Project Name",
    description: "Brief summary of what it does and why it was built.",
    technologies: ["Flutter", "Dart", "Firebase"],
    githubUrl: "https://github.com/username/project",
    icon: Icons.rocket_launch_rounded,
    isFeatured: true,
  ),
];
```

### 3. Colors & styling (optional)
Primary and surface colors can be modified in `lib/theme/app_theme.dart`.

---

## Getting Started

### Requirements
- Flutter SDK `>= 3.10.0`
- Dart SDK `>= 3.0.0`

### Setup & Run

Clone and fetch dependencies:
```bash
git clone https://github.com/rehan-abc/Portfolio-flutter-.git
cd Portfolio-flutter-
flutter pub get
```

Run in Chrome:
```bash
flutter run -d chrome
```

Run on Windows / macOS desktop:
```bash
flutter run -d windows
```

Run tests:
```bash
flutter test
```

### Build for Production (Web)

```bash
flutter build web --release
```
The static output will be located in `build/web/`, ready to deploy to GitHub Pages, Vercel, Firebase Hosting, or Cloudflare Pages.

---

## Project Structure

```
experiments/       # Hands-on Flutter & Dart Experiments (1 to 10)
lib/
├── constants/     # Profile constants, social URLs, and nav labels
├── data/          # Project list, skill metrics, and experience entries
├── models/        # Typed models (ProjectModel, SkillModel, ExperienceModel)
├── screens/       # HomeScreen containing the single-page layout
├── theme/         # Material 3 light/dark ThemeData
├── utils/         # Responsive breakpoint helpers
├── widgets/       # Modular UI sections (Hero, About, Projects, etc.)
└── main.dart      # App entry point and theme state holder
```

---

## License

Distributed under the [MIT License](LICENSE). Feel free to use this template for your personal site.
