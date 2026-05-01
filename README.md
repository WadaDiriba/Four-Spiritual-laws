# Four Spiritual Laws

A Flutter application presenting the Four Spiritual Laws in Afaan Oromoo.

## Overview

This app displays the Four Spiritual Laws gospel presentation with:
- Law 1: God Loves You (Waaqayyo si jaalata)
- Law 2: Man is Sinful (Namni Cubbamaadha)
- Law 3: Jesus Christ is God's Provision (Yesuus Kiristoos, Karaa Fayyinaati)
- Law 4: Receive Christ (Kiristoos fudhu)

Each law includes:
- Title in Afaan Oromoo
- Biblical verse reference
- Detailed description
- Topic categorization

## Features

- **Content Screen**: List view of all Four Spiritual Laws
- **Detail Screen**: Detailed view of each law with verse, description, and topic
- **Afaan Oromoo Language**: Content presented in local language
- **Clean UI**: Material Design with custom styling

## Getting Started

### Prerequisites

- Flutter SDK (3.10.7 or higher)
- Dart SDK
- Android Studio / Xcode / VS Code

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

## Project Structure

```
lib/
├── book_model.dart          # Book data model
├── book_provider.dart       # State management with Provider
├── constants/
│   └── app_color.dart       # App color constants
├── screens/
│   ├── content_screen.dart  # List of all laws
│   └── detail_screen.dart   # Individual law details
├── widgets/
│   ├── app_bar.dart         # Custom app bar
│   └── drawer.dart          # Navigation drawer
└── main.dart                # App entry point
```

## Data Source

Book content is loaded from `assets/books.json` for easy content updates.

## Dependencies

- `provider: ^6.1.1` - State management
- `flutter` - UI framework

## License

This project is open source and available for educational purposes.
