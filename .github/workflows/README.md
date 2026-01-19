# GitHub Actions Workflows

This directory contains automated workflows for building the Ramadan Quran App.

## Available Workflows

### 1. Build APK (`build-apk.yml`)

**Triggers:**
- Every push to any branch
- Every pull request
- Manual trigger via GitHub Actions tab

**What it does:**
- Builds release APK
- Uploads APK as downloadable artifact
- Keeps artifact for 30 days

**How to download:**
1. Go to: https://github.com/YOUR_USERNAME/flutter-Islamic-App-test-/actions
2. Click on the latest workflow run
3. Scroll down to "Artifacts"
4. Download `ramadan-quran-app-release`

### 2. Create Release (`build-release.yml`)

**Triggers:**
- Push a git tag starting with `v` (e.g., `v1.0.0`)
- Manual trigger via GitHub Actions tab

**What it does:**
- Builds universal APK
- Builds split APKs (smaller files for specific devices)
- Creates GitHub Release with all APKs
- Adds release notes

**How to create a release:**
```bash
# Tag your version
git tag v1.0.0

# Push the tag
git push origin v1.0.0
```

Then go to: https://github.com/YOUR_USERNAME/flutter-Islamic-App-test-/releases

## Build Times

- **Build APK workflow:** ~5-8 minutes
- **Create Release workflow:** ~10-15 minutes

## APK Files

### Universal APK
- **File:** `app-release.apk`
- **Size:** ~45 MB
- **Works on:** All Android devices

### Split APKs
- **arm64-v8a:** For newer phones (most common)
- **armeabi-v7a:** For older phones
- **x86_64:** For emulators

## Manual Trigger

You can manually trigger any workflow:

1. Go to **Actions** tab on GitHub
2. Select the workflow
3. Click **Run workflow**
4. Choose branch
5. Click **Run workflow** button

## Troubleshooting

### Workflow fails with "dependencies error"
- Check `pubspec.yaml` for correct package versions
- Make sure all packages support null safety

### Build takes too long
- Normal first build: 5-10 minutes
- Subsequent builds: 3-5 minutes (cached dependencies)

### APK not available
- Wait for workflow to complete (green checkmark)
- Check "Artifacts" section in workflow run page

## Status Badges

Add to your README.md:

```markdown
![Build APK](https://github.com/YOUR_USERNAME/flutter-Islamic-App-test-/actions/workflows/build-apk.yml/badge.svg)
```

## Cost

✅ **FREE for public repositories!**
- 2,000 minutes per month (free tier)
- Each build uses ~5-10 minutes
- Can build ~200-400 times per month for free

## Security

- Runs in isolated environment
- No access to your local machine
- Builds are publicly visible (for public repos)
- Artifacts auto-delete after 30 days
