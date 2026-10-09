# 🚀 Flutter Developer Portfolio

A modern, responsive, and elegant personal portfolio application built with **Flutter** and **Material 3**. Designed for cross-platform deployment across Web, Android, iOS, and Desktop.

---

## ✨ Features

- 🌓 **Dynamic Theme Switching**: Seamlessly toggle between dark and light themes with custom curated color schemes.
- 📱 **Fully Responsive Layout**: Adaptive layouts tailored for Mobile (<768px), Tablet (768-1100px), and Desktop (>1100px).
- 🧭 **Smooth Navigation**: Single-page smooth scrolling to designated sections with active indicators and back-to-top floating button.
- ⚡ **Zero External Heavy Dependencies**: Built cleanly using Flutter SDK's native Material 3 design system for maximum stability and speed.
- 🎯 **Interactive Tech Stack Grid**: Filterable skills catalog by Mobile, Frontend, Backend, and DevOps with proficiency indicators.
- 💼 **Project Showcase Cards**: Highlighting projects with tech stack badges, descriptions, and direct GitHub links.
- ⏳ **Experience Timeline**: Career milestones, education, and bulleted achievements.
- 📬 **Interactive Contact Form**: Client-side validated message form with feedback snackbars and direct social connection tiles.

---

## 📁 Project Architecture

```
flutter/
├── android/                   # Android platform scaffolding & manifests
├── lib/
│   ├── constants/             # Profile details, bio, and app strings
│   │   └── app_constants.dart
│   ├── data/                  # Repository containing mock portfolio data
│   │   └── portfolio_data.dart
│   ├── models/                # Typed data models
│   │   ├── experience_model.dart
│   │   ├── project_model.dart
│   │   └── skill_model.dart
│   ├── screens/               # Main screen containers
│   │   └── home_screen.dart
│   ├── theme/                 # Material 3 dark and light design systems
│   │   └── app_theme.dart
│   ├── utils/                 # Breakpoints and responsive helpers
│   │   └── responsive.dart
│   ├── widgets/               # Modular UI section components
│   │   ├── about_section.dart
│   │   ├── contact_section.dart
│   │   ├── experience_section.dart
│   │   ├── footer.dart
│   │   ├── hero_section.dart
│   │   ├── navbar.dart
│   │   ├── projects_section.dart
│   │   └── skills_section.dart
│   └── main.dart              # App entry point with theme state manager
├── test/
│   └── widget_test.dart       # Widget and integration test suite
├── web/                       # Web PWA manifest and HTML template
│   ├── index.html
│   └── manifest.json
├── pubspec.yaml               # Project dependencies and metadata
└── README.md                  # Documentation
```

---

## 🛠️ Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version `>= 3.10.0`)
- [Dart SDK](https://dart.dev/get-dart) (version `>= 3.0.0`)

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/rehan-abc/Portfolio-flutter-.git
   cd Portfolio-flutter-
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Web:**
   ```bash
   flutter run -d chrome
   ```

4. **Run on Android / iOS / Desktop:**
   ```bash
   flutter run
   ```

5. **Run test suite:**
   ```bash
   flutter test
   ```

---

## 📄 License

This project is licensed under the MIT License. Feel free to use this template for your own developer portfolio!