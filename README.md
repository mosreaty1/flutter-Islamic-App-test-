# Ramadan Quran Kareem App

A comprehensive Islamic mobile application built with Flutter, featuring Quran reading, prayer times, Ramadan tracking, and more.

## Features

### Core Features
- **Full Quran Reader**
  - Complete Quran with Arabic text
  - English translations
  - Bookmark verses
  - Continue reading from last position
  - Search functionality
  - Beautiful Arabic typography

- **Prayer Times**
  - Automatic location-based prayer time calculations
  - Next prayer countdown
  - Prayer time notifications
  - Support for different calculation methods

- **Ramadan Calendar & Fasting Tracker**
  - 30-day Ramadan calendar
  - Track fasting days
  - Progress visualization
  - Ramadan information and virtues

### Additional Features
- **Tasbih Counter**
  - Digital counter for Dhikr
  - Multiple Dhikr options (SubhanAllah, Alhamdulillah, etc.)
  - Target settings (11, 33, 99, 100)
  - Progress tracking

- **Hadith Collection**
  - Authentic Hadiths from Sahih Bukhari and Muslim
  - Categorized by topic
  - Arabic text with English translation
  - Narrator and reference information

- **Dua Collection**
  - Daily supplications
  - Morning and evening remembrances
  - Arabic text with transliteration and translation
  - Categorized by occasion

- **Islamic Calendar**
  - Hijri date display
  - Gregorian to Hijri converter
  - Important Islamic events
  - Monthly calendar view

## Technologies Used

- **Flutter SDK**: Cross-platform mobile development
- **Provider**: State management
- **Adhan Package**: Accurate prayer time calculations
- **Quran Package**: Complete Quran data
- **Hijri Calendar**: Islamic date calculations
- **Google Fonts**: Beautiful typography
- **Local Notifications**: Prayer time reminders
- **Geolocator**: Location-based features

## Installation

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS/Android development setup

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ramadan-quran-app.git
   cd ramadan-quran-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── quran_screen.dart
│   ├── surah_detail_screen.dart
│   ├── prayer_times_screen.dart
│   ├── ramadan_screen.dart
│   ├── tasbih_screen.dart
│   ├── hadith_screen.dart
│   ├── dua_screen.dart
│   └── islamic_calendar_screen.dart
├── models/                   # Data models
│   ├── prayer_times_model.dart
│   ├── hadith_model.dart
│   └── dua_model.dart
├── services/                 # Business logic
│   ├── prayer_service.dart
│   ├── quran_service.dart
│   └── notification_service.dart
├── widgets/                  # Reusable widgets
├── utils/                    # Utilities
│   └── app_theme.dart
└── data/                     # Static data
    ├── hadith_data.dart
    └── dua_data.dart
```

## Configuration

### Android Permissions
Add these permissions to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE" />
```

### iOS Permissions
Add these to `ios/Runner/Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location for accurate prayer times.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location for prayer time notifications.</string>
```

## Features in Detail

### Prayer Times
The app uses the Adhan package with the Muslim World League calculation method. Prayer times are calculated based on:
- Device GPS location
- Current date and time
- Selected calculation method
- Madhab preference (Shafi/Hanafi for Asr)

### Quran Reader
- Full text of all 114 Surahs
- Arabic text with proper formatting
- Translation toggle
- Verse bookmarking
- Last read position tracking
- Surah information (Makki/Madani, verse count)

### Ramadan Tracker
- Hijri calendar integration
- Visual calendar grid
- Tap to mark fasting days
- Progress percentage
- Ramadan information

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Quran data from the Quran package
- Hadith translations from authentic sources
- Prayer time calculations using the Adhan package
- Islamic calendar using the Hijri package

## Support

For support, email support@ramadanquranapp.com or open an issue in the repository.

## Roadmap

- [ ] Audio Quran recitation with multiple reciters
- [ ] Qibla compass
- [ ] Offline mode
- [ ] Multiple languages
- [ ] Custom themes
- [ ] Widget support
- [ ] Apple Watch / Wear OS support

---

**May Allah accept this work and make it beneficial for the Muslim Ummah.**

اللَّهُمَّ آمِين
