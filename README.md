# App Development Internship 2025 🚀

Welcome to the **App Development Internship 2025** repository. This repository houses all coursework, documentation, assignments, and Flutter application source code completed as part of the internship program.

---

## 📂 Repository Structure

```text
APP-DEVOLOPMENT-INTERNSHIP-2025/
├── internship-docs/               # Internship documentation, daily notes & assignments
│   ├── About/
│   │   ├── 07-08-2025 (1).pdf
│   │   ├── DATE_06-08-2025 - Google Docs (1).pdf
│   │   ├── DATE_08-08-2025 - Google Docs.pdf
│   │   ├── EXAM (3).pdf
│   │   └── FLUTTER ASSIGNMENT (2).pdf
│   └── tic tac toe.pdf
├── weather-app/                   # Student Connect / Weather Application (Flutter)
│   ├── main.dart                  # App routing and theme
│   ├── home_screen.dart           # Dashboard with drawer navigation
│   ├── weather_screen.dart        # Weather forecast view
│   ├── tasks_screen.dart          # Task manager with full CRUD & storage
│   ├── contact_admin.dart         # Contact form with validation & animations
│   └── about_screen (1).dart      # App description & info screen
└── README.md                      # Repository overview & documentation
```

---

##  1. Internship Documentation & Reports (`internship-docs/`)

Contains documentation, daily progress reports, practical exams, and assignments completed during the program:
- **Daily Progress & Notes**:
  - `DATE_06-08-2025 - Google Docs (1).pdf`
  - `07-08-2025 (1).pdf`
  - `DATE_08-08-2025 - Google Docs.pdf`
- **Assessment & Assignments**:
  - `EXAM (3).pdf` — Examination submission.
  - `FLUTTER ASSIGNMENT (2).pdf` — Flutter coursework and practical exercises.
  - `tic tac toe.pdf` — Tic Tac Toe game development documentation.

---

##  2. Student Connect / Weather Application (`weather-app/`)

### Project Overview
**Student Connect** is a mobile utility application designed for students, offering daily weather forecasts, personal task management (CRUD), and an admin contact system.

### Project Background
> This project was initially started around the end of 2nd semester in 1st year. Because the project was still work-in-progress back then, the original repository was removed. It has now been revived, organized, and integrated into this internship repository.

### Key Features
- ** Home Screen (`home_screen.dart`)**:
  - Drawer navigation menu linking all app sections.
  - Modern green aesthetic using Google Fonts (`Poppins`).
- ** Weather Screen (`weather_screen.dart`)**:
  - Daily weather forecasts (Yesterday, Today, Tomorrow) with temperatures, conditions, and icons.
- ** Tasks Screen (`tasks_screen.dart`)**:
  - Full CRUD operations (Add, View, Toggle Completion, Delete).
  - Local persistence via `shared_preferences` so data persists across app restarts.
- ** Contact Admin (`contact_admin.dart`)**:
  - Form validation for Name, Email, Subject, and Message.
  - Smooth fade-in UI animations (`AnimationController`).
- ** About Screen (`about_screen (1).dart`)**:
  - Information about the application and its features.

### Tech Stack & Dependencies
- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Packages**:
  - `shared_preferences: ^2.2.0` — Local storage for tasks
  - `google_fonts: ^6.1.0` — Typography styling

---

##  How to Run the Flutter App

1. Ensure the [Flutter SDK](https://docs.flutter.dev/get-started/install) is installed.
2. Navigate to your Flutter project directory or place the `weather-app/` files into your project's `lib/` folder.
3. Add the dependencies in `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     google_fonts: ^6.1.0
     shared_preferences: ^2.2.0
   ```
4. Run:
   ```bash
   flutter pub get
   flutter run
   ```
