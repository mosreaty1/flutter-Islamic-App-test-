# VS Code Setup Guide for Ramadan Quran App

## Step-by-Step Instructions

### 1. Install Flutter SDK

#### Windows:
```bash
# Download Flutter SDK
# Visit: https://docs.flutter.dev/get-started/install/windows
# Extract to C:\src\flutter
# Add C:\src\flutter\bin to your PATH environment variable
```

#### macOS:
```bash
# Install using Homebrew
brew install flutter

# OR download manually
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:$HOME/flutter/bin"
```

#### Linux:
```bash
# Download Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:$HOME/flutter/bin"
```

### 2. Verify Flutter Installation

```bash
flutter doctor
```

This will show you what needs to be installed. You'll need:
- Flutter SDK ✓
- Android Studio (for Android development)
- Xcode (for iOS development - macOS only)
- VS Code with Flutter extension

### 3. Install VS Code Extensions

1. Open VS Code
2. Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac)
3. Search and install:
   - **Flutter** (by Dart Code)
   - **Dart** (by Dart Code)

### 4. Open the Project in VS Code

1. Open VS Code
2. Click **File → Open Folder**
3. Navigate to the project directory
4. Click **Select Folder**

OR use command line:
```bash
cd /path/to/flutter-Islamic-App-test-
code .
```

### 5. Install Dependencies

Open the integrated terminal in VS Code:
- Press `` Ctrl+` `` (backtick) or **Terminal → New Terminal**

Run:
```bash
flutter pub get
```

This will download all the required packages listed in `pubspec.yaml`.

### 6. Set Up an Emulator/Device

#### Option A: Android Emulator

1. **Install Android Studio** (if not already installed)
   - Download from: https://developer.android.com/studio

2. **Create Virtual Device:**
   - Open Android Studio
   - Click **Tools → Device Manager**
   - Click **Create Device**
   - Select a device (e.g., Pixel 5)
   - Download a system image (e.g., Android 13)
   - Click **Finish**

3. **Start the emulator:**
   ```bash
   flutter emulators
   flutter emulators --launch <emulator_id>
   ```

#### Option B: iOS Simulator (macOS only)

```bash
# Open iOS Simulator
open -a Simulator
```

#### Option C: Physical Device

**Android:**
1. Enable Developer Options on your phone
2. Enable USB Debugging
3. Connect via USB
4. Accept debugging prompt on phone

**iOS:**
1. Connect iPhone via USB
2. Trust the computer
3. In Xcode, add your Apple ID

### 7. Check Connected Devices

In VS Code terminal:
```bash
flutter devices
```

You should see your emulator/device listed.

### 8. Run the App

#### Method 1: Using VS Code UI (Recommended)

1. Open `lib/main.dart`
2. Look at the bottom-right corner of VS Code
3. Click on "No Device" and select your device/emulator
4. Press `F5` or click **Run → Start Debugging**
5. OR press `Ctrl+F5` for **Run → Run Without Debugging**

#### Method 2: Using Command Palette

1. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
2. Type "Flutter: Launch Emulator"
3. Select your emulator
4. Then press `F5` to run

#### Method 3: Using Terminal

```bash
# Run on connected device
flutter run

# Run on specific device
flutter run -d <device_id>

# Run in release mode (faster)
flutter run --release
```

### 9. Hot Reload During Development

While the app is running:
- Press `r` in the terminal for **hot reload** (instant updates)
- Press `R` for **hot restart** (full restart)
- Press `q` to quit

OR in VS Code:
- Save any Dart file (`Ctrl+S`) to trigger hot reload automatically

## Troubleshooting

### Issue: "Flutter SDK not found"

**Solution:**
```bash
# Verify Flutter is in PATH
flutter --version

# If not found, add to PATH
# Windows: Edit Environment Variables
# Mac/Linux: Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:/path/to/flutter/bin"
```

### Issue: "No devices found"

**Solution:**
```bash
# Check connected devices
flutter devices

# Start an emulator
flutter emulators
flutter emulators --launch <emulator_name>

# For Android: Make sure Android emulator is running
# For iOS: Open Simulator app
```

### Issue: "Waiting for another flutter command to release the startup lock"

**Solution:**
```bash
# Delete the lock file
rm /path/to/flutter/bin/cache/lockfile
```

### Issue: Dependencies not installing

**Solution:**
```bash
# Clean and reinstall
flutter clean
flutter pub get
```

### Issue: "Gradle build failed" (Android)

**Solution:**
1. Make sure Android SDK is installed via Android Studio
2. Accept Android licenses:
   ```bash
   flutter doctor --android-licenses
   ```

### Issue: Location permissions not working

**Solution:**

1. **Android:** Add to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

2. **iOS:** Add to `ios/Runner/Info.plist`:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs location for prayer times</string>
   ```

## VS Code Shortcuts for Flutter

| Shortcut | Action |
|----------|--------|
| `F5` | Start Debugging |
| `Ctrl+F5` | Run Without Debugging |
| `Shift+F5` | Stop Debugging |
| `Ctrl+Shift+P` | Command Palette |
| `Ctrl+Space` | Auto-complete |
| `Alt+Shift+F` | Format Document |
| `` Ctrl+` `` | Toggle Terminal |

## Useful Commands

```bash
# Check Flutter installation
flutter doctor -v

# List all devices
flutter devices

# List all emulators
flutter emulators

# Install dependencies
flutter pub get

# Clean build files
flutter clean

# Build APK (Android)
flutter build apk

# Build App Bundle (Android)
flutter build appbundle

# Build iOS (macOS only)
flutter build ios

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Development Tips

1. **Enable Hot Reload:** Save files frequently to see changes instantly
2. **Use Dart DevTools:** Press `Ctrl+Shift+P` → "Dart: Open DevTools"
3. **Widget Inspector:** View widget tree and properties
4. **Performance Overlay:** See FPS and rendering performance
5. **Debug Console:** View print statements and errors

## Next Steps

Once the app is running:

1. **Test Features:**
   - Grant location permissions for prayer times
   - Browse the Quran
   - Try the Tasbih counter
   - Check Ramadan calendar
   - Read Hadith and Duas

2. **Customize:**
   - Modify colors in `lib/utils/app_theme.dart`
   - Add more Hadiths in `lib/data/hadith_data.dart`
   - Add more Duas in `lib/data/dua_data.dart`

3. **Build for Production:**
   ```bash
   # Android APK
   flutter build apk --release

   # Android App Bundle (for Play Store)
   flutter build appbundle --release

   # iOS (macOS only)
   flutter build ios --release
   ```

## Resources

- Flutter Documentation: https://docs.flutter.dev/
- Flutter YouTube: https://www.youtube.com/c/flutterdev
- Dart Documentation: https://dart.dev/guides
- VS Code Flutter: https://docs.flutter.dev/tools/vs-code

---

**Need Help?**

If you encounter any issues:
1. Run `flutter doctor` to diagnose problems
2. Check the VS Code Output panel (View → Output)
3. Look at the Debug Console for error messages
4. Search for errors on Stack Overflow or GitHub Issues

May Allah make this development journey easy for you! 🚀
