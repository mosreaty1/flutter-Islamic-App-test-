# Quick Start Guide - 5 Minutes to Running App

## Prerequisites Check

```bash
# Check if Flutter is installed
flutter --version

# If not installed, see SETUP_GUIDE.md
```

## Quick Steps

### 1. Install VS Code Flutter Extension

Open VS Code → Extensions (`Ctrl+Shift+X`) → Search "Flutter" → Install

### 2. Open Project

```bash
cd /home/user/flutter-Islamic-App-test-
code .
```

### 3. Install Dependencies

Open Terminal in VS Code (`` Ctrl+` ``) and run:

```bash
flutter pub get
```

### 4. Start Emulator

**Android:**
```bash
flutter emulators                    # List available emulators
flutter emulators --launch <name>   # Start emulator
```

**iOS (macOS only):**
```bash
open -a Simulator
```

### 5. Run the App

Press `F5` in VS Code

OR

```bash
flutter run
```

## That's It! 🎉

The app should now be running on your emulator/device.

## Common First-Time Issues

### "No device found"
- **Solution:** Start an emulator first (Step 4)

### "Flutter SDK not found"
- **Solution:** Install Flutter SDK from https://docs.flutter.dev/get-started/install

### "Pub get failed"
- **Solution:** Run `flutter clean` then `flutter pub get`

---

For detailed instructions, see [SETUP_GUIDE.md](SETUP_GUIDE.md)
