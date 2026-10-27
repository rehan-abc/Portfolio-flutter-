# Portfolio Web & Mobile

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/rehan-abc/Portfolio-flutter-/pulls)

A single-page developer portfolio built with Flutter and Material 3. It runs natively across web, desktop, and mobile from a single codebase, with zero third-party UI dependencies to keep maintenance minimal and builds fast.

---

## Demo Preview


https://github.com/user-attachments/assets/896c5ae7-36c5-4dfd-9a48-b6fd569046db
- **Desktop:** `w >= 1150px` (Multi-column grids, inline navigation)
- **Mobile:** `w < 900px` (Single column, drawer menu, touch-friendly tap targets)


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
