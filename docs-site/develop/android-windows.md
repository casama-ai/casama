# Android builds on Windows

How to set up a Windows PC (x64) to run, debug and release-build the Casama Android app (phone and
Wear OS) with the same toolchain as the Mac. Everything installs per user; only the last section
needs an administrator.

## Toolchain

| Piece | Version | Where |
| --- | --- | --- |
| Flutter | 3.50.x (D-212) | your existing install; `flutter config --enable-android` if Android is off |
| JDK | Temurin 17 (zip) | `%LOCALAPPDATA%\Programs\jdk-17.*` |
| Android SDK | cmdline-tools `latest` | `%LOCALAPPDATA%\Android\Sdk` |
| Node.js | 24 (zip) | `%LOCALAPPDATA%\Programs\nodejs` (`package-android.sh` writes `firebase_ids.xml` with it) |
| jq | winget `jqlang.jq` | |
| Bitwarden CLI | winget `Bitwarden.CLI` | |
| gplay | 1.0.2, `gplay-windows-amd64.exe` from [tamtom/play-console-cli](https://github.com/tamtom/play-console-cli/releases) (check `checksums.txt`) | `%LOCALAPPDATA%\Programs\gplay\gplay.exe` |
| gh, Git Bash | | the scripts are bash: run them from Git Bash |

Gradle 9.5, AGP and Kotlin come from the Gradle wrapper; nothing to install.

SDK packages. The `.bat` wrapper splits arguments at `;`, so write the package paths with `/`:

```sh
sdkmanager platform-tools emulator platforms/android-36 platforms/android-37.0 \
  build-tools/35.0.0 build-tools/36.0.0 build-tools/37.0.0 \
  ndk/28.2.13676358 ndk/29.0.14206865 cmake/3.22.1 extras/google/usb_driver \
  system-images/android-37.0/google_apis_playstore/x86_64 \
  system-images/android-37.0/android-wear-signed/x86_64
```

User environment: `JAVA_HOME` (the JDK), `ANDROID_HOME` (the SDK), and on `Path` the JDK's `bin`,
`platform-tools`, `emulator`, `cmdline-tools\latest\bin`, gplay and Node. Then
`flutter config --jdk-dir <JDK>` and `flutter doctor --android-licenses`.

## Emulators

Use x86_64 images (the Mac uses arm64). The emulator runs on the Windows Hypervisor Platform:
`emulator -accel-check` should say "WHPX … is installed and usable".

```sh
avdmanager create avd -n Casama_Pixel_10 -d pixel_10 -k "system-images;android-37.0;google_apis_playstore;x86_64"
avdmanager create avd -n Casama_Wear_Small_Round -d wearos_small_round -k "system-images;android-37.0;android-wear-signed;x86_64"
avdmanager create avd -n Casama_Wear_Large_Round -d wearos_large_round -k "system-images;android-37.0;android-wear-signed;x86_64"
flutter emulators --launch Casama_Pixel_10
```

## Signing and config for release builds

Same layout as the Mac: the upload keystore and `android-key.properties` live in
`%USERPROFILE%\.config\casama\` (outside the repo; `storeFile` is an absolute path with forward
slashes), and `client/android/key.properties` is a copy of that file. They come from the vault
items "Casama · Android upload key (ai.casama.app)" and "Casama · Android upload keystore file
(base64)". Check the key with `keytool` against `UPLOAD_CERT_SHA256` in
`scripts/release-android.sh`, and limit the files to your user
(`icacls <file> /inheritance:r /grant:r "%USERNAME%:F"`).

`client/config/telemetry.json` is the JSON in "Casama · GitHub Actions secret
(CASAMA_TELEMETRY_JSON)". `client/config/maps.json` holds `CASAMA_GOOGLE_MAPS_KEY` and
`CASAMA_MAPTILER_KEY` from their vault items, plus `CASAMA_HERE_MAPS_KEY` when you have one.

The vault: `scripts/release-android.sh` only finds a Bitwarden session on Linux (`bw-session`) and
macOS (Keychain). On Windows, export `BW_SESSION` in Git Bash before you run it.

## Needs an administrator (once)

- **USB debugging:** install the Google USB driver from an elevated prompt:
  `pnputil /add-driver "%LOCALAPPDATA%\Android\Sdk\extras\google\usb_driver\android_winusb.inf" /install`.
- **Long paths:** set `LongPathsEnabled=1` under
  `HKLM\SYSTEM\CurrentControlSet\Control\FileSystem`, so NDK and CMake builds in the release
  worktree (`~/.cache/casama-release/android-<build>`) don't hit the 260-character limit.
- Optional: Android Studio (`winget install Google.AndroidStudio`) for its debugger and layout
  inspector, and Windows Defender exclusions for the checkout, the SDK and `%USERPROFILE%\.gradle`.

## Run and release

```sh
cd client && flutter run -d emulator-5554 --dart-define-from-file=config/firebase.json
scripts/package-wear.sh debug     # Wear OS debug APK, then adb -s <watch> install -r <apk>
scripts/release-android.sh        # dry run; --yes builds and ships (ask first, AGENTS.md)
```
