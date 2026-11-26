import 'dart:async';

import 'package:casama/theme/bundled_font_loader.dart';
import 'package:casama/ui/ambient_motion.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Runs before every test file. Tests draw text in a test font, so the bundled families that load
/// on first use (lazyBundledFonts) stay unloaded: a load finishing after a test would schedule a
/// frame for a tree that is gone.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  bundledFontLoadingEnabled = false;
  // Looping decorative motion never settles; tests that check it turn it back on.
  ambientMotionEnabled = false;
  // The keychain plugin never answers in widget tests; an in-memory keychain does (the kept Casama
  // Cloud session is read by Settings).
  FlutterSecureStorage.setMockInitialValues({});
  await testMain();
}
