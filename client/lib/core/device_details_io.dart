import 'dart:io' show Platform;

/// The OS version text for the ads attribution install record (iOS, macOS, Windows, Linux).
/// Android's is the kernel's, not the Android version, so it's left out there.
String? deviceOsVersion() {
  try {
    if (Platform.isAndroid) return null;
    final v = Platform.operatingSystemVersion.trim();
    if (v.isEmpty) return null;
    return v.length > 32 ? v.substring(0, 32) : v;
  } catch (_) {
    return null;
  }
}

/// The number of CPU cores, for the ads attribution install record.
int? deviceCpuCores() {
  try {
    return Platform.numberOfProcessors;
  } catch (_) {
    return null;
  }
}
