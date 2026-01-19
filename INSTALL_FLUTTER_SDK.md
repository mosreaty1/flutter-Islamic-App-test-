# Flutter SDK Installation Guide

## The Problem

When you press "Run" in VS Code, nothing happens because Flutter SDK is not installed on your system.

## Solution: Install Flutter SDK

### For Windows

#### Method 1: Using Git (Recommended)

1. **Install Git** (if not already installed):
   - Download from: https://git-scm.com/download/win
   - Install with default options

2. **Open Command Prompt or PowerShell**

3. **Clone Flutter repository:**
   ```powershell
   cd C:\
   git clone https://github.com/flutter/flutter.git -b stable
   ```

4. **Add Flutter to PATH:**
   - Right-click **This PC** → **Properties**
   - Click **Advanced system settings**
   - Click **Environment Variables**
   - Under **User variables**, find **Path**
   - Click **Edit** → **New**
   - Add: `C:\flutter\bin`
   - Click **OK** on all windows

5. **Verify installation:**
   ```powershell
   flutter doctor
   ```

#### Method 2: Download ZIP

1. **Download Flutter SDK:**
   - Visit: https://docs.flutter.dev/get-started/install/windows
   - Click "Download Flutter SDK"
   - Extract to `C:\src\flutter`

2. **Add to PATH:**
   - Add `C:\src\flutter\bin` to your PATH (see Method 1 step 4)

3. **Verify:**
   ```powershell
   flutter doctor
   ```

---

### For macOS

#### Method 1: Using Homebrew (Easiest)

1. **Install Homebrew** (if not installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Flutter:**
   ```bash
   brew install --cask flutter
   ```

3. **Verify:**
   ```bash
   flutter doctor
   ```

#### Method 2: Manual Installation

1. **Download Flutter SDK:**
   ```bash
   cd ~/development
   git clone https://github.com/flutter/flutter.git -b stable
   ```

2. **Add to PATH:**
   ```bash
   echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
   source ~/.zshrc
   ```

3. **Verify:**
   ```bash
   flutter doctor
   ```

---

### For Linux

1. **Install dependencies:**
   ```bash
   sudo apt-get update
   sudo apt-get install curl git unzip xz-utils zip libglu1-mesa
   ```

2. **Download Flutter:**
   ```bash
   cd ~
   git clone https://github.com/flutter/flutter.git -b stable
   ```

3. **Add to PATH:**
   ```bash
   echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

4. **Verify:**
   ```bash
   flutter doctor
   ```

---

## After Installing Flutter

### Step 1: Run Flutter Doctor

```bash
flutter doctor
```

This will show you what else needs to be installed. You'll see something like:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.16.0, on macOS 14.0)
[✗] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK
[✗] Xcode - develop for iOS and macOS
[✗] Chrome - develop for the web
[✓] VS Code (version 1.85)
[!] Connected device
```

### Step 2: Install Android Studio (For Android Development)

1. **Download Android Studio:**
   - Visit: https://developer.android.com/studio
   - Download and install

2. **Open Android Studio:**
   - Go through the setup wizard
   - It will download Android SDK, SDK tools, etc.

3. **Install Flutter & Dart plugins:**
   - File → Settings → Plugins
   - Search "Flutter" and install
   - Search "Dart" and install

4. **Accept Android licenses:**
   ```bash
   flutter doctor --android-licenses
   ```
   Press 'y' to accept all

### Step 3: Create an Android Emulator

1. **Open Android Studio**
2. **Tools → Device Manager**
3. **Click "Create Device"**
4. **Select a device** (e.g., Pixel 5)
5. **Download a system image** (e.g., Android 13)
6. **Click Finish**

### Step 4: Install Xcode (For iOS Development - macOS Only)

1. **Open App Store**
2. **Search "Xcode"**
3. **Install** (this takes a while, it's ~12GB)
4. **Accept license:**
   ```bash
   sudo xcodebuild -license
   ```
5. **Install command line tools:**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

---

## Quick Start After Installation

### 1. Restart VS Code

Close and reopen VS Code completely.

### 2. Verify Flutter in VS Code

Open VS Code terminal and run:
```bash
flutter doctor -v
```

### 3. Check for Devices

```bash
flutter devices
```

If you see "No devices", you need to start an emulator:

```bash
# List available emulators
flutter emulators

# Launch one
flutter emulators --launch <emulator_id>
```

### 4. Install Project Dependencies

In your project folder:
```bash
cd /home/user/flutter-Islamic-App-test-
flutter pub get
```

### 5. Run the App

Now press **F5** in VS Code, or run:
```bash
flutter run
```

---

## Troubleshooting After Installation

### Issue: "flutter: command not found"

**Solution:** Flutter not in PATH
```bash
# Add to PATH (adjust path as needed)
export PATH="$PATH:/path/to/flutter/bin"

# Or for permanent (Linux/Mac):
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

### Issue: "No devices found"

**Solution:** Start an emulator or connect a device

**Android Emulator:**
```bash
flutter emulators
flutter emulators --launch <name>
```

**Physical Android Device:**
1. Enable Developer Options on phone
2. Enable USB Debugging
3. Connect via USB
4. Accept debugging prompt

**iOS Simulator (macOS only):**
```bash
open -a Simulator
```

### Issue: "Unable to locate Android SDK"

**Solution:** Install Android Studio (see Step 2 above)

### Issue: "cmdline-tools component is missing"

**Solution:** Install Android SDK command-line tools:
1. Open Android Studio
2. Settings → Appearance & Behavior → System Settings → Android SDK
3. SDK Tools tab
4. Check "Android SDK Command-line Tools"
5. Click Apply

---

## Minimum Requirements

Before Flutter will work, you need AT LEAST:

✅ **Flutter SDK** - The framework itself
✅ **VS Code** - Your code editor
✅ **Dart plugin** - Comes with Flutter extension
✅ **One of these:**
   - Android Studio + Android SDK (for Android)
   - Xcode (for iOS, macOS only)
   - Chrome (for web development)
   - A physical device with USB debugging

---

## Expected Output When Working

When everything is set up correctly, `flutter doctor` should show:

```
Doctor summary:
[✓] Flutter (Channel stable, 3.16.0)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.1)
[✓] VS Code (version 1.85)
[✓] Connected device (1 available)
```

Not everything needs a checkmark, but you need at least:
- ✓ Flutter
- ✓ One platform (Android/iOS/Web)
- ✓ VS Code
- ✓ At least one device

---

## Quick Installation Commands (Copy-Paste)

### macOS (with Homebrew):
```bash
brew install --cask flutter
flutter doctor
flutter doctor --android-licenses
```

### Linux:
```bash
sudo apt-get install curl git unzip xz-utils zip libglu1-mesa
git clone https://github.com/flutter/flutter.git -b stable ~/flutter
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
flutter doctor
```

### Windows (PowerShell as Administrator):
```powershell
cd C:\
git clone https://github.com/flutter/flutter.git -b stable
# Then manually add C:\flutter\bin to PATH
flutter doctor
```

---

## After Everything is Installed

Run this final check:
```bash
cd /home/user/flutter-Islamic-App-test-
flutter doctor
flutter pub get
flutter devices
```

If you see devices listed, you're ready! Press **F5** in VS Code.

---

## Still Stuck?

1. **Take a screenshot** of `flutter doctor` output
2. **Share the error** you're getting
3. **Check your OS** and choose the right installation method above

The most common path to success:
1. Install Flutter SDK (15 minutes)
2. Install Android Studio (30 minutes)
3. Create an emulator (5 minutes)
4. Run `flutter pub get` (2 minutes)
5. Press F5 in VS Code (instant)

Total time: ~1 hour for complete setup.

Good luck! 🚀
