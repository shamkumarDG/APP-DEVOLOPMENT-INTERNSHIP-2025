# Student Connect 📱🌱

**Student Connect** is a mobile application built with **Flutter** designed to assist students in their day-to-day academic life with essential utility tools, including local weather updates, a task manager (To-Do list with CRUD operations), and a direct admin contact channel.

---

## 📌 Project Background & History

> **Note on Repository History:**  
> This project was originally started during the **end of 2nd semester in the 1st year of college**. An initial repository was created at that time; however, because the project was not fully finalized and was still in progress, the earlier repository was deleted to clear out unfinished work.  
> 
> This new repository has been created to cleanly archive, document, and maintain the codebase with a clear structure, proper documentation, and a fresh start.

---

## ✨ Features

- **🏠 Home Dashboard (`home_screen.dart`)**:
  - Intuitive navigation drawer linking all modules.
  - Consistent and modern green gradient UI theme using Google Fonts (`Poppins`).

- **🌤️ Weather Forecast (`weather_screen.dart`)**:
  - Displays daily weather conditions (Yesterday, Today, Tomorrow).
  - Shows temperature, weather status, and visual weather indicators.

- **📝 Task Manager / CRUD (`tasks_screen.dart`)**:
  - Full CRUD task operations (Create, Read, Update, Delete).
  - Mark tasks as completed or pending.
  - Persistent local storage using `shared_preferences` so tasks remain saved across app restarts.

- **📩 Contact Admin Form (`contact_admin.dart`)**:
  - Form with input validation for Student Name, Email, Subject, and Message.
  - Smooth fade-in transitions powered by Flutter animations (`AnimationController`).
  - Clear and Submit functionalities with confirmation feedback.

- **ℹ️ About Screen (`about_screen (1).dart`)**:
  - Overview of the application goals, feature highlights, and technology stack.

---

## 🛠️ Tech Stack & Packages

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **State & Storage**: `shared_preferences` (local key-value data persistence)
- **Typography**: `google_fonts` (`Poppins`)
- **UI Components**: Material Design with custom green-palette gradients and animations

---

## 📂 Project Structure

```text
weather/
├── main.dart               # Main entry point and route definitions
├── home_screen.dart        # Dashboard screen with navigation drawer
├── weather_screen.dart     # Weather forecast display
├── tasks_screen.dart       # To-Do list with full CRUD & local storage
├── contact_admin.dart      # Contact form with validation & animations
├── about_screen (1).dart   # Information about the app
└── README.md               # Project documentation
```

---

## 🚀 Getting Started (How to Run in a Flutter Project)

To run these screens within a Flutter environment:

1. Ensure [Flutter SDK](https://docs.flutter.dev/get-started/install) is installed.
2. In your Flutter project's `pubspec.yaml`, add the required dependencies:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     google_fonts: ^6.1.0
     shared_preferences: ^2.2.0
   ```
3. Run:
   ```bash
   flutter pub get
   flutter run
   ```
