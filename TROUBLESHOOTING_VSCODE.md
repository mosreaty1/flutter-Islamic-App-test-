# Troubleshooting VS Code Errors

## Problem: "Undefined name" errors in VS Code

If you see errors like:
- ❌ Undefined name 'FontStyle'
- ❌ Undefined name 'Colors'
- ❌ The name 'SizedBox' isn't a class
- ❌ The method 'Container' isn't defined

These errors mean **VS Code hasn't loaded the Flutter dependencies yet**.

## Solution (Choose One)

### Method 1: Quick Fix (Recommended)

1. **Open Terminal in VS Code** (`` Ctrl+` `` or `` Cmd+` ``)

2. **Run these commands:**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Reload VS Code:**
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type: "Developer: Reload Window"
   - Press Enter

4. **Wait for analysis to complete** (bottom right shows "Analyzing...")

### Method 2: Using VS Code Command Palette

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type: "Flutter: Get Packages"
3. Press Enter
4. Wait for completion
5. Reload VS Code window

### Method 3: Manual Flutter Commands

Open terminal and run:

```bash
# Navigate to project
cd /home/user/flutter-Islamic-App-test-

# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Verify everything is working
flutter doctor
```

### Method 4: Restart Dart Analysis Server

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type: "Dart: Restart Analysis Server"
3. Press Enter
4. Wait for analysis to complete

## Verify the Fix

After running the fix, check:

1. **Bottom Status Bar**: Should show "No Issues" or problems count decreasing
2. **Problems Panel**: Should clear or show reduced errors
3. **Syntax Highlighting**: Code should be properly colored

## If Errors Still Persist

### Check 1: Flutter SDK Installed?

```bash
flutter --version
```

If not found, install Flutter SDK:
- **Windows**: https://docs.flutter.dev/get-started/install/windows
- **macOS**: `brew install flutter`
- **Linux**: https://docs.flutter.dev/get-started/install/linux

### Check 2: VS Code Extensions Installed?

Required extensions:
- ✅ **Dart** (by Dart Code)
- ✅ **Flutter** (by Dart Code)

To install:
1. Press `Ctrl+Shift+X`
2. Search "Flutter"
3. Install both extensions
4. Reload VS Code

### Check 3: Flutter Doctor

Run diagnostics:
```bash
flutter doctor -v
```

Look for:
- ✅ Flutter SDK
- ✅ Dart SDK
- ✅ VS Code (with extensions)
- ❌ Android toolchain (only if you need Android)
- ❌ Xcode (only if you need iOS on macOS)

Fix any issues shown.

### Check 4: Workspace Configuration

Ensure you opened the **folder** (not just a file):
1. File → Open Folder
2. Select: `/home/user/flutter-Islamic-App-test-/`
3. Click "Select Folder"

### Check 5: pubspec.yaml Valid?

Open `pubspec.yaml` and check for:
- ✅ Proper indentation (2 spaces)
- ✅ All dependencies listed
- ❌ No red underlines

If you see errors, run:
```bash
flutter pub get
```

## Common Causes

| Issue | Cause | Solution |
|-------|-------|----------|
| "Undefined name" errors | Dependencies not installed | `flutter pub get` |
| Red squiggly lines everywhere | Dart analyzer not started | Restart analysis server |
| Import statements red | Package not found | `flutter pub get` |
| Nothing works | Flutter SDK not in PATH | Add Flutter to PATH |
| Slow analysis | Large project | Wait or increase resources |

## Quick Command Cheatsheet

```bash
# Fix most issues
flutter clean && flutter pub get

# Check Flutter installation
flutter doctor -v

# List devices
flutter devices

# Run the app
flutter run

# Restart Dart analyzer (in VS Code)
Ctrl+Shift+P → "Dart: Restart Analysis Server"

# Reload VS Code window
Ctrl+Shift+P → "Developer: Reload Window"
```

## Still Having Issues?

### Option 1: Close and Reopen VS Code

Sometimes a simple restart fixes everything:
1. Close VS Code completely
2. Reopen the project folder
3. Wait for analysis to complete (30 seconds - 2 minutes)

### Option 2: Delete Cache

```bash
cd /home/user/flutter-Islamic-App-test-

# Remove cached files
rm -rf .dart_tool/
rm -rf .flutter-plugins
rm -rf .flutter-plugins-dependencies
rm -rf .packages

# Reinstall
flutter clean
flutter pub get
```

### Option 3: Create New Terminal

In VS Code:
1. Kill existing terminal (trash icon)
2. Open new terminal (`` Ctrl+` ``)
3. Run `flutter pub get`

### Option 4: Check for Syntax Errors

Look in the PROBLEMS panel:
- Click on each error
- Fix any actual syntax errors
- The undefined name errors should resolve after `flutter pub get`

## Expected Timeline

After running `flutter pub get`:
- **10-30 seconds**: Downloading packages
- **30-60 seconds**: Analyzing code
- **1-2 minutes**: First-time setup

Watch the bottom status bar in VS Code:
- "Analyzing..." - Wait
- "Pub get..." - Wait
- "No Issues" - ✅ Done!

## Prevention

To avoid this in the future:
1. Always run `flutter pub get` after cloning
2. Let VS Code finish analysis before coding
3. Don't close VS Code during "Analyzing..."
4. Keep Flutter SDK updated: `flutter upgrade`

## Video Tutorial (Alternative)

If text instructions aren't working, search YouTube for:
- "Flutter VS Code setup tutorial"
- "Fix undefined name Flutter"
- "Flutter pub get VS Code"

## Get Help

If nothing works:
1. Check your Flutter version: `flutter --version`
2. Check your VS Code version: Help → About
3. Take a screenshot of the error
4. Search the error on:
   - Stack Overflow
   - Flutter GitHub Issues
   - Flutter Discord

---

**Quick Copy-Paste Fix:**

```bash
flutter clean && flutter pub get && flutter doctor
```

Then in VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"

✅ This fixes 95% of analysis errors!
