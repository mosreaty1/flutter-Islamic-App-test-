# Flutter Installation Checklist

Use this checklist to track your progress. Mark items with [x] as you complete them.

## Pre-Installation

- [ ] I know my operating system: Windows / macOS / Linux
- [ ] I have at least 10 GB of free disk space
- [ ] I have a stable internet connection

## Step 1: Install Flutter SDK

- [ ] Downloaded Flutter SDK
- [ ] Extracted/Cloned to a permanent location
- [ ] Added Flutter to system PATH
- [ ] Opened new terminal/command prompt
- [ ] Verified with: `flutter --version` ✓
- [ ] Ran: `flutter doctor`

## Step 2: Install Development Tools

Choose at least ONE platform:

### For Android Development:
- [ ] Downloaded Android Studio
- [ ] Installed Android Studio
- [ ] Ran Android Studio setup wizard
- [ ] Installed Android SDK
- [ ] Accepted Android licenses: `flutter doctor --android-licenses`
- [ ] Installed Flutter plugin in Android Studio
- [ ] Created an Android emulator (Virtual Device)

### For iOS Development (macOS only):
- [ ] Installed Xcode from App Store
- [ ] Accepted Xcode license: `sudo xcodebuild -license`
- [ ] Ran: `sudo xcode-select --switch /Applications/Xcode.app`
- [ ] Installed CocoaPods: `sudo gem install cocoapods`
- [ ] Opened iOS Simulator

### For Web Development:
- [ ] Chrome browser installed
- [ ] Enabled web support: `flutter config --enable-web`

## Step 3: Set Up VS Code

- [ ] Installed VS Code
- [ ] Installed "Flutter" extension
- [ ] Installed "Dart" extension
- [ ] Restarted VS Code
- [ ] Opened VS Code settings to verify Flutter SDK detected

## Step 4: Verify Everything Works

Run these commands and verify output:

```bash
flutter doctor
```
- [ ] Shows [✓] Flutter
- [ ] Shows [✓] at least one platform (Android/iOS/Web)
- [ ] Shows [✓] VS Code

```bash
flutter devices
```
- [ ] Shows at least one device/emulator

```bash
flutter emulators
```
- [ ] Shows available emulators (for Android)

## Step 5: Set Up the Project

In the project directory (`/home/user/flutter-Islamic-App-test-/`):

- [ ] Opened project folder in VS Code
- [ ] Ran: `flutter pub get`
- [ ] No errors in terminal
- [ ] Waited for "Analyzing..." to finish (bottom bar in VS Code)
- [ ] No red underlines in `lib/main.dart`

## Step 6: Run the App

- [ ] Started emulator or connected device
- [ ] Ran: `flutter devices` - shows my device
- [ ] Opened `lib/main.dart` in VS Code
- [ ] Selected device in bottom-right corner of VS Code
- [ ] Pressed F5 or clicked Run → Start Debugging
- [ ] App started building
- [ ] App launched on device/emulator
- [ ] Saw the home screen! 🎉

## Troubleshooting (If Stuck)

If something doesn't work, check these:

### Common Issue 1: "flutter command not found"
- [ ] Restarted terminal
- [ ] Verified Flutter in PATH
- [ ] Ran: `echo $PATH` (Mac/Linux) or `echo %PATH%` (Windows)
- [ ] See Flutter directory listed

### Common Issue 2: "No devices found"
- [ ] Android Studio Device Manager → Create Device
- [ ] Started emulator
- [ ] Or connected physical device with USB debugging enabled
- [ ] Ran: `flutter devices` again

### Common Issue 3: "Waiting for another flutter command..."
- [ ] Closed all terminals
- [ ] Restarted VS Code
- [ ] Deleted lock file: `rm flutter/bin/cache/lockfile`

### Common Issue 4: Red errors in VS Code
- [ ] Ran: `flutter clean`
- [ ] Ran: `flutter pub get`
- [ ] Restarted Dart Analysis Server (Ctrl+Shift+P → Dart: Restart Analysis Server)
- [ ] Reloaded VS Code window

### Common Issue 5: Build fails
- [ ] Ran: `flutter clean`
- [ ] Deleted build folders
- [ ] Ran: `flutter pub get`
- [ ] Tried: `flutter run` in terminal to see detailed error

## Final Verification

When everything works, you should be able to:

- [x] Run `flutter doctor` with no critical errors
- [x] See devices when running `flutter devices`
- [x] Open project in VS Code without errors
- [x] Press F5 and app launches
- [x] See the Ramadan Quran app home screen

## Time Estimates

| Task | Time Needed |
|------|-------------|
| Download Flutter SDK | 5-10 min |
| Install Android Studio | 20-30 min |
| Create emulator | 5-10 min |
| Install VS Code extensions | 2 min |
| Run flutter pub get | 2-5 min |
| First app launch | 2-3 min |
| **Total** | **~45-60 min** |

## What You'll See When It Works

1. **Terminal shows:**
   ```
   Launching lib/main.dart on Android SDK built for x86...
   ✓ Built build/app/outputs/flutter-apk/app-debug.apk.
   Installing build/app/outputs/flutter-apk/app.apk...
   ```

2. **Emulator shows:**
   - App icon appears
   - Home screen loads
   - "Ramadan Quran Kareem" title visible
   - Prayer times card
   - Grid of feature buttons

3. **VS Code shows:**
   - Debug toolbar at top
   - Console output
   - "Debug Session Active" indicator

## Resources

- **Flutter Installation Docs**: https://docs.flutter.dev/get-started/install
- **VS Code Setup**: https://docs.flutter.dev/tools/vs-code
- **Flutter YouTube**: https://www.youtube.com/flutterdev
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/flutter

## Need Help?

If you're stuck:
1. Check which step failed (mark above)
2. Read `INSTALL_FLUTTER_SDK.md` for detailed instructions
3. Read `TROUBLESHOOTING_VSCODE.md` for VS Code issues
4. Search your error message on Google/Stack Overflow
5. Ask on Flutter Discord: https://discord.gg/flutter

---

**Current Status:**
- [ ] Not started
- [ ] In progress (at Step ___)
- [ ] Completed! ✓

**Started on:** ___________

**Completed on:** ___________

---

Good luck! You're building something amazing! 🌙
