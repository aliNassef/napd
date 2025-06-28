# MAHD - Your Ultimate Motherhood Guide

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)](https://firebase.google.com/)

MAHD is a comprehensive Flutter-based mobile application designed to assist parents in tracking their baby's development, accessing educational content, and connecting with a community of other parents. The app features baby profile management, cry translation, educational videos, podcasts, and more.

## 📱 Features

### 👶 Baby Management
- Create and manage multiple baby profiles
- Track baby's growth and milestones
- Cry translation feature to help understand baby's needs
- Update and maintain baby's health records

### 🎓 Educational Content
- Access to a library of parenting articles
- Educational videos for different age groups
- Podcasts on parenting topics
- Top recommendations for you based on your baby's age

### 🗣️ Community & Support
- Interactive chatbot for parenting advice
- Community groups and forums
- Share experiences with other parents
- Get expert advice and tips

### 🔔 Notifications
- Customizable reminders for feeding, sleeping, and medical check-ups
- Important updates and new content notifications
- Personalized alerts based on baby's age and development stage

## 🛠️ Technical Stack

- **Framework**: Flutter (Dart)
- **State Management**: BLoC Pattern
- **Backend Services**: Firebase (Authentication, Firestore, Storage)
- **Local Storage**: Shared Preferences, Hive
- **API Integration**: Dio for network requests
- **Video Playback**: YouTube Player, WebView, ExoPlayer
- **Audio Processing**: For cry translation feature
- **Localization**: Easy Localization for multi-language support
- **UI Components**: Custom widgets and Material Design 3

## 📂 Project Structure

```
lib/
├── core/                  # Core functionality and utilities
│   ├── api/               # API clients and services
│   ├── cache/             # Local storage and caching
│   ├── di/                # Dependency injection
│   ├── errors/            # Custom error classes
│   ├── extensions/        # Dart extensions
│   ├── utils/             # Helper functions and utilities
│   └── widgets/           # Reusable widgets
│
├── features/             # Feature modules
│   ├── baby/              # Baby management feature
│   ├── boarding/          # Onboarding flow
│   ├── groups/            # Community groups
│   ├── home/              # Home screen and main navigation
│   ├── layout/            # App layout structure
│   ├── login/             # Authentication
│   ├── notifications/     # Push notifications
│   ├── on_boarding/       # First-time user experience
│   ├── podcast/           # Podcast player
│   ├── profile/           # User profile management
│   ├── search/            # Search functionality
│   ├── settings/          # App settings
│   └── splash/            # Splash screen
│
└── main.dart            # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for emulators)
- VS Code or Android Studio (recommended IDEs)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aliNassef/napd.git
   cd napd
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android and iOS apps to your Firebase project
   - Download the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS
   - Place these files in the appropriate directories

4. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

Run tests using the following command:
```bash
flutter test
```

## 🏗️ Build

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter community for the amazing framework
- All the package developers whose work made this app possible
- The open-source community for continuous support and contributions

---

<div align="center">
  Made with ❤️ by MAHD Team
</div>
